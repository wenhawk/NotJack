<?php

namespace app\models;

use Yii;

use app\models\Payment;

class YearReport
{

  public static function getYearArray(){
      $array = [];
      $temp = 0;
      for ($i=0; $i < 5; $i++) {
        $year = new YearReport();
        $y = date('Y', strtotime(date('Y').' - '.$i.'  Year'));
        // echo $i.' '.$y.'<br>';
        $year->year = $y;
        $amount = $temp + Payment::find()->where(['between', 'start_date' , $y.'-01-01', $y.'-12-31'])->sum('amount');
        $year->amount = $amount;
        array_push($array,$year);
      }
      return $array;
  }

}
