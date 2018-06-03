<?php

namespace app\models;
use app\models\Payment;
use app\models\Invoice;
use app\models\MyInvoice;
use yii\web\UploadedFile;
use app\models\Debit;

use Yii;

class MyPayment extends Payment
{

    public static function getTdsAmount($invoice){
      $amount = Payment::find()->where(['status' => '1'])
      ->andWhere(['invoice_id' => $invoice->invoice_id ])
      ->sum('tds_amount');
      return $amount;
    }

  public static function generatePaymentCode(){
    date_default_timezone_set('Asia/Kolkata');
    $year = date('Y');
    $year = substr($year,2,3);
    $invoiceCode = 'GIDC/' . $year;
    $year = intval($year) + 1;
    $invoiceCode = $invoiceCode . '-' . $year;
    $latestPayment = Payment::find()
    ->where(['status' => '1'])
    ->orderBy(['payment_id' => SORT_DESC])
    ->one();
    if($latestPayment){
      $invoiceID = strval($latestPayment->payment_id+1);
    }
    else{
      $invoiceID = '1';
    }
    $len = strlen($invoiceID);
    for ($i=0; $i < (4 - $len); $i++) {
      $invoiceID = '0'. $invoiceID;
    }
    $invoiceCode = $invoiceCode . '/' . $invoiceID;
    return $invoiceCode;
  }

  public static function calculatePenalInterest($order,$interest,$diffDate){
    $totalLeaseRent = MyInvoice::getTotalLeaseRent($order);
    $totalLeaseRentPaid = MyInvoice::getTotalLeaseRentPaid($order);
    $balanceLeaseRent = $totalLeaseRent - $totalLeaseRentPaid;
    $penalAmount = 0;
    // Penal intrest needs to be paid
    if($balanceLeaseRent != 0){
      if($diffDate > 0){
        $penalAmount = (($diffDate  * ($interest->rate)/100) * $balanceLeaseRent ) / 365;
        }
    }
    return $penalAmount;
  }



    public function generatePayment($status,$controller) {
      if ($this->load(Yii::$app->request->post())) {
        $pi = $this->penal;
        $invoice = MyInvoice::findOne($this->invoice_id);
        $order = Orders::findOne($this->order_id);
        $totalPenal = MyInvoice::getTotalPenal($order) + $pi;
        $totalPenalPaid = MyInvoice::getTotalPenalPaid($order);
        $balancePenal = $totalPenal - $totalPenalPaid;
        $totalAmount = MyInvoice::getTotalAmount($order);
        $totalAmountPaid = $invoice->getTotalAmountOnInvoicePaid();
        $totalLeaseRent = MyInvoice::getTotalLeaseRent($order);
        $totalLeaseRentPaid = MyInvoice::getTotalLeaseRentPaid($order);
        $totalTaxPaid = MyInvoice::getTotalTaxPaid($order);
        $totalTax = MyInvoice::getTotalTax($order);
        $balanceTax = $totalTax - $totalTaxPaid;
        $balanceLease = $totalLeaseRent - $totalLeaseRentPaid;
        $balanceAmount = $balanceTax + $balanceLease + $balancePenal;
        echo '$balanceTax'.$balanceTax.'<br>';
        echo '$balanceLease'.$balanceLease.'<br>';
        echo '$balancePenal'.$balancePenal.'<br>';
        echo '$balanceAmount'.$balanceAmount.'<br>';
        $tds_paid = MyPayment::getTdsAmount($invoice);
        if($this->tds_amount > 0 && $this->tds_amount){
          $percent = ($this->tds_amount * 100) / ($invoice->current_lease_rent + $invoice->prev_lease_rent);
          if($percent < 9.0 || $percent > 10.1 ){
            Yii::$app->session->setFlash('danger', "TDS AMOUNT SHOULD BE BETWEEN 9% to 10.1%, Your Amount: ".round($percent,2));
            return $controller->redirect(['invoice/view' ,'id' => $invoice->invoice_id]);
          }
          if($tds_paid > 0 ){
            Yii::$app->session->setFlash('danger', "TDS ALREDY PAID ON INVOICE");
            return $controller->redirect(['invoice/view' ,'id' => $invoice->invoice_id]);
          }
        }else{
          $this->tds_amount = 0;
        }
        $this->amount = $this->amount + $this->tds_amount;
        if(($this->amount) > $balanceAmount){ //Trying to pay extra
          Yii::$app->session->setFlash('danger', "TRYING TO PAY EXTRA");
          return $controller->redirect(['invoice/view' ,'id' => $invoice->invoice_id]);
        }

        $totalTaxAndLease =  $balanceTax + $balanceLease;
        $totalTax = $totalTax - $totalTaxPaid;
        $totalLeaseRent = $totalLeaseRent - $totalLeaseRentPaid;
        if($totalTaxAndLease != 0){
          $taxPerectage = ($totalTax * 100) / $totalTaxAndLease;
          $leasePerectage = ($totalLeaseRent * 100) / $totalTaxAndLease;
        }else{
          $taxPerectage = 0;
          $leasePerectage = 0;
        }
        if($this->amount >= ($totalTaxAndLease)){
              $totalTaxPaying = $balanceTax;
              $totalLeasePaying = $balanceLease;
        if($balanceAmount == $this->amount){
              $this->penal = $balancePenal;
              $this->balance_amount = 0;
          }else{
                $balancePenalNotPaid = $this->amount - ($balanceTax + $balanceLease);
                $this->penal = $balancePenalNotPaid;
          }
        }else{
          $totalTaxAndLease = $this->amount;
          $totalTaxPaying = ($taxPerectage/100) * $totalTaxAndLease;
          $totalLeasePaying = ($leasePerectage/100) * $totalTaxAndLease;
          $this->penal = 0;
        }
        $this->lease_rent = round($totalLeasePaying);
        $this->tax = round($totalTaxPaying);
        $this->file = UploadedFile::getInstance($this, 'file');
        if($this->file){
          $this->tds_file = 'tdsfiles/' . $this->file->baseName . '.' . $this->file->extension;
          $this->file->saveAs('tdsfiles/' .$this->file->baseName . '.' . $this->file->extension);
        }
        $this->balance_amount =  $balanceAmount;
        $this->status =  $status;
        $this->payment_no = MyPayment::generatePaymentCode();
        $this->save(False);
         //Generate Debit Note
          if($pi > 0){
            $debit = new Debit();
            $debit->penal = $pi;
            $debit->invoice_id = $invoice->invoice_id;
            $debit->order_id = $invoice->order->order_id;
            $debit->payment_id = $this->payment_id;
            $debit->start_date = date('Y-m-d');
            $debit->save(False);
          }
      }
    }


}
