<?php

namespace app\models;
use app\models\Invoice;
use app\models\OrderRate;
use app\models\Orders;
use app\models\Payment;
use app\models\Debit;
use app\models\Interest;
use app\models\Tax;
use app\models\Mail;

use Yii;

class MyInvoice extends Invoice
{

    public static function createInvoices(){
      $orders = Orders::find()->all();
      foreach ($orders as $order) {
        $invoice = Invoice::find()->where(['order_id' => $order->order_id])
        ->andWhere(['flag' => '1'])
        ->orderBy(['invoice_id' => SORT_DESC])
        ->one();
        echo 'hello <br>';
        echo '$order number'.$order->order_number.'<br>';
        echo '$invoice'.$invoice->invoice_id.'<br>';
        if($invoice){
        $date = date('Y-m-d', strtotime($invoice->due_date. ''));
        $diffDate = MyInvoice::getDateDifference($date);
        $diffDate = -30;
          if($diffDate == -30 ){
            echo 'created';
            MyInvoice::generateInvoice($order);
          }
        }
      }
    }

    public static function generateInvoiceCode($areaCode){
      date_default_timezone_set('Asia/Kolkata');
      $year = date('Y');
      $year = substr($year,2,3);
      $invoiceCode = $areaCode . '/' . $year;
      $year = intval($year) + 1;
      $invoiceCode = $invoiceCode . '-' . $year;
      $latestInvoice = Invoice::find()
      ->andWhere(['flag' => '1'])
      ->orderBy(['invoice_id' => SORT_DESC])
      ->one();
      if($latestInvoice){
        $invoiceID = strval($latestInvoice->invoice_id+1);
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

    public static function getDateDifference($date){
      date_default_timezone_set('Asia/Kolkata');
      $today = date('Y-m-d');
      $diff =  strtotime($today) - strtotime($date);
      $diffDate  = $diff / (60*60*24);
      return $diffDate;
    }

    public static function getOrderRate($order){
      $order_rate = OrderRate::find()->where(['order_id' => $order->order_id])
      ->andWhere(['flag' => '1'])->one();
      return $order_rate;
    }

    public static function getTotalTaxPaid($order){
      $amount = Payment::find()->where(['order_id' => $order->order_id])
      ->andWhere(['status' => '1'])
      ->sum('tax');
      // echo 'TotalTaxPaid'.$amount.'<br>';
      return $amount;
    }

    public static function getTotalTax($order){
      $amount1 = Invoice::find()->where(['order_id' => $order->order_id])
      ->andWhere(['flag' => '1'])
      ->sum('current_tax');
      // echo 'TotalTax'.($amount1).'<br>';
      return $amount1;
    }

    public static function getTotalLeaseRent($order){
      $amount = Invoice::find()->where(['order_id' => $order->order_id])
      ->andWhere(['flag' => 1])
      ->sum('current_lease_rent');
      // echo 'TotalLeaseRent'.$amount.'<br>';
      return $amount;
    }

    public static function getTotalPenal($order){
      $amount = Debit::find()->where(['order_id' => $order->order_id])
      ->andWhere(['flag' => '1'])
      ->sum('penal');
      echo 'getTotalPenal'.$amount.'<br>';
      return $amount;
    }

    public function getTotalPenalForInvoice(){
      $amount = Debit::find()->where(['invoice_id' => $this->invoice_id])
      ->andWhere(['flag' => '1'])
      ->sum('penal');
      return $amount;
    }

    public static function getTotalLeaseRentPaid($order){
      $amount = Payment::find()->where(['order_id' => $order->order_id])
      ->andWhere(['status' => '1'])
      ->sum('lease_rent');
      // echo 'TotalLeaseRentPaid'.$amount.'<br>';
      return $amount;
    }

    public static function getTotalPenalPaid($order){
      $amount = Payment::find()->where(['order_id' => $order->order_id])
      ->andWhere(['status' => '1'])
      ->sum('penal');
      echo 'getTotalPenalPaid'.$amount.'<br>';
      return $amount;
    }

    public static function getTotalAmount($order){
      $invoice = Invoice::find()->where(['order_id' => $order->order_id])
      ->andWhere(['flag' => '1'])
      ->orderBy(['invoice_id' => SORT_DESC])->one();
       echo 'getTotalAmount'.$invoice->total_amount.'<br>';
      return $invoice->total_amount;
    }

    public function getTotalAmountOnInvoicePaid(){
      $amount1 = Payment::find()->where(['invoice_id' => $this->invoice_id])
      ->andWhere(['status' => '1'])
      ->sum('amount');
       echo 'TotalAmountOnInvoicePaid'.($amount1).'<br>';
       echo '$this->invoice_id'.$this->invoice_id.'<br>';
      return $amount1;
    }


    public static function calculateBalancePenalAmount($order){
      $totalPenal = MyInvoice::getTotalPenal($order);
      $totalPenalPaid = MyInvoice::getTotalPenalPaid($order);
      $balancePenal = $totalPenal - $totalPenalPaid;
      return $balancePenal;
    }

    public static function calculatePenalInterest($order,$prevInvoice,$interest){
      $totalLeaseRent = MyInvoice::getTotalLeaseRent($order);
      $totalLeaseRentPaid = MyInvoice::getTotalLeaseRentPaid($order);
      $balanceLeaseRent = $totalLeaseRent - $totalLeaseRentPaid;
      $penalAmount = 0;
      // Penal intrest needs to be paid
      if($balanceLeaseRent != 0){
        $diffDate = MyInvoice::getDateDifference($prevInvoice->due_date);
        if($diffDate > 0){
          $penalAmount = (($diffDate  * ($interest->rate)/100) * $balanceLeaseRent ) / 365;
          }
      }
      return $penalAmount;
    }

    public static function generateInvoice($order){
      date_default_timezone_set('Asia/Kolkata');
      $prevInvoice = MyInvoice::find()->where(['order_id' => $order->order_id])
      ->orderBy(['invoice_id' => SORT_DESC ])->one();

      $invoice = new Invoice();
      $order_rate = MyInvoice::getCurrentOrderRate($order);
      $tax = MyInvoice::getCurrentTax();
      $interest =  MyInvoice::getCurrentInterest();
      $area = $order->area;
      $areaCode = strtoupper(substr($area->name,0,3));

      $invoice->order_id = $order->order_id;
      $invoice->tax_id = $tax->tax_id;
      $invoice->interest_id = $interest->interest_id;
      // First Inovice
      if(!$prevInvoice){
        $invoice->prev_lease_rent = 0;
        $invoice->start_date = date('Y-m-d');
        $invoice->prev_tax = 0;
        $invoice->prev_interest = 0;
        $invoice->prev_dues_total = 0;
        $invoice->current_lease_rent = $order_rate->amount1;
        $order_rate = MyInvoice::getOrderRate($order);
        $diffDate = MyInvoice::getDateDifference($order_rate->end_date);
        if($diffDate >= 0){ // NEED TO ADD AMOUNT2
          $invoice->current_lease_rent = $order_rate->amount1 + $order_rate->amount2;
        }
        $invoice->current_tax = ($tax->rate/100) * $invoice->current_lease_rent;
        $invoice->current_dues_total = $invoice->current_tax + $invoice->current_lease_rent;
        $invoice->due_date = date('Y-m-d', strtotime($order->start_date. ''));
        $invoice->lease_current_start = $invoice->due_date;
        $invoice->lease_prev_start = $invoice->due_date;
        $invoice->total_amount = $invoice->current_dues_total;
        $invoice->flag = '1';
        $invoice->invoice_code = MyInvoice::generateInvoiceCode($areaCode);
        $invoice->email_status = '0';
        // CG EMAIL
        $invoice->save();
        $email = new Mail();
        $email->sendMail($invoice->invoice_id);
      }else{
        $invoice->prev_lease_rent = $prevInvoice->current_lease_rent;
        $invoice->start_date = date('Y-m-d');
        $invoice->prev_tax = $prevInvoice->current_tax;
        $penalAmount = MyInvoice::calculatePenalInterest($order,$prevInvoice,$interest);
        $balancePenal = MyInvoice::calculateBalancePenalAmount($order);
        $invoice->prev_interest = round($penalAmount+$balancePenal);
        $totalAmount = MyInvoice::getTotalAmount($order);
        $totalAmount = $totalAmount + $prevInvoice->getTotalPenalForInvoice();
        $totalAmountPaid = $prevInvoice->getTotalAmountOnInvoicePaid();
        $due = $totalAmount - $totalAmountPaid;
        $invoice->prev_dues_total = $due + $invoice->prev_interest;
        $invoice->current_lease_rent = $order_rate->amount1;
        $order_rate = MyInvoice::getOrderRate($order);
        $diffDate = MyInvoice::getDateDifference($order_rate->end_date);
        if($diffDate >= 0){ // NEED TO ADD AMOUNT2
          $invoice->current_lease_rent = $order_rate->amount1 + $order_rate->amount2;
        }
        $invoice->current_tax = ($tax->rate/100) * $invoice->current_lease_rent;
        $invoice->current_dues_total = $invoice->current_tax + $invoice->current_lease_rent;
        $invoice->due_date = date('Y-m-d', strtotime($prevInvoice->due_date. ' + 1 year'));
        $invoice->lease_current_start = $invoice->due_date;
        $invoice->lease_prev_start = $prevInvoice->due_date;
        $invoice->total_amount = $invoice->current_dues_total + $invoice->prev_dues_total;
        $invoice->flag = '1';
        $invoice->invoice_code = MyInvoice::generateInvoiceCode($areaCode);
        $invoice->email_status = '0';
        // CG EMAIL
        $invoice->save();
        $email = new Mail();
        $email->sendMail($invoice->invoice_id);
        //Generate Debit Note
        // echo $penalAmount;
        if($penalAmount > 0){
          $debit = new Debit();
          $debit->penal = round($penalAmount);
          $debit->invoice_id = $invoice->invoice_id;
          $debit->order_id = $order->order_id;
          $debit->flag = '1';
          $debit->save(False);
        }
      }
      return $invoice;
    }

    public static function getCurrentOrderRate($order){
      $order_rate = OrderRate::find()
      ->where(['order_id' => $order->order_id ])
      ->andWhere(['flag' => 1])
      ->one();

      return $order_rate;
    }

    public static function getCurrentTax(){
      $tax = Tax::find()
      ->where(['flag' => 1])
      ->one();
      return $tax;
    }

    public static function getCurrentInterest(){
      $interest = Interest::find()
      ->where(['name' => 'Penal Interest'])
      ->andWhere(['flag' => 1])
      ->one();

      return $interest;
    }


}
