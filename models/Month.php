<?php

namespace app\models;

use Yii;

use app\models\Payment;
use app\models\Invoice;
use app\models\Debit;

class Month
{

  public function setData($year){
    $temp = 0;
    $this->janPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-01-01", $year."-01-31" ])->sum('amount');
    $this->febPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-02-01", $year."-02-29" ])->sum('amount');
    $this->marPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-03-01", $year."-03-31" ])->sum('amount');
    $this->aprPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-04-01", $year."-04-30" ])->sum('amount');
    $this->mayPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-05-01", $year."-05-31" ])->sum('amount');
    $this->junPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-06-01", $year."-06-30" ])->sum('amount');
    $this->julPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-07-01", $year."-07-31" ])->sum('amount');
    $this->augPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-08-01", $year."-08-31" ])->sum('amount');
    $this->sepPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-09-01", $year."-09-30" ])->sum('amount');
    $this->octPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-10-01", $year."-10-31" ])->sum('amount');
    $this->novPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-11-01", $year."-11-31" ])->sum('amount');
    $this->decPaid = $temp + Payment::find()->where(['between', 'start_date', $year."-12-01", $year."-12-31" ])->sum('amount');

    $jan = Invoice::find()->where(['between', 'due_date', $year."-01-01", $year."-01-31" ])->sum('current_dues_total');
    $this->jan = $jan + Debit::find()->where(['between', 'start_date', $year."-01-01", $year."-01-31" ])->sum('penal');

    $feb = Invoice::find()->where(['between', 'due_date', $year."-02-01", $year."-02-29" ])->sum('current_dues_total');
    $this->feb = $feb + Debit::find()->where(['between', 'start_date', $year."-02-01", $year."-02-29" ])->sum('penal');

    $mar = Invoice::find()->where(['between', 'due_date', $year."-03-01", $year."-03-31" ])->sum('current_dues_total');
    $this->mar = $mar + Debit::find()->where(['between', 'start_date', $year."-03-01", $year."-03-31" ])->sum('penal');

    $apr = Invoice::find()->where(['between', 'due_date', $year."-04-01", $year."-04-30" ])->sum('current_dues_total');
    $this->apr = $apr + Debit::find()->where(['between', 'start_date', $year."-04-01", $year."-04-30" ])->sum('penal');

    $may = Invoice::find()->where(['between', 'due_date' , $year."-05-01", $year."-05-31" ])->sum('current_dues_total');
    $this->may = $may + Debit::find()->where(['between', 'start_date', $year."-05-01", $year."-05-31" ])->sum('penal');

    $jun = Invoice::find()->where(['between', 'due_date', $year."-06-01", $year."-06-30" ])->sum('current_dues_total');
    echo 'hello'.$jun.'<br>';
    echo Debit::find()->where(['between', 'start_date', $year."-06-01", $year."-06-30" ])->sum('penal');
    $this->jun = $jun + Debit::find()->where(['between', 'start_date', $year."-06-01", $year."-06-30" ])->sum('penal');

    $jul = Invoice::find()->where(['between', 'due_date', $year."-07-01", $year."-07-31" ])->sum('current_dues_total');
    $this->jul = $jul + Debit::find()->where(['between', 'start_date', $year."-07-01", $year."-07-31" ])->sum('penal');

    $aug = Invoice::find()->where(['between', 'due_date', $year."-08-01", $year."-08-31" ])->sum('current_dues_total');
    $this->aug = $aug + Debit::find()->where(['between', 'start_date', $year."-08-01", $year."-08-31" ])->sum('penal');

    $sep = Invoice::find()->where(['between', 'due_date', $year."-09-01", $year."-09-30" ])->sum('current_dues_total');
    $this->sep = $sep + Debit::find()->where(['between', 'start_date', $year."-09-01", $year."-09-30" ])->sum('penal');

    $oct = Invoice::find()->where(['between', 'due_date', $year."-10-01", $year."-10-31" ])->sum('current_dues_total');
    $this->oct= $oct + Debit::find()->where(['between', 'start_date', $year."-10-01", $year."-10-31" ])->sum('penal');

    $nov = Invoice::find()->where(['between', 'due_date', $year."-11-01", $year."-11-31" ])->sum('current_dues_total');
    $this->nov = $nov + Debit::find()->where(['between', 'start_date', $year."-11-01", $year."-11-31" ])->sum('penal');

    $dec = Invoice::find()->where(['between', 'due_date', $year."-12-01", $year."-12-31" ])->sum('current_dues_total');
    $this->dec = $dec + Debit::find()->where(['between', 'start_date', $year."-12-01", $year."-12-31" ])->sum('penal');

  }

}
