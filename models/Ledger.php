<?php
namespace app\models;

use Yii;

class Ledger extends \yii\base\Model
{

    /**
     *
     * @inheritdoc
     */
    public $particulars;
    public $amount;
    public $date;
	  public $type;
	  public $flag;
	  public $inoviceTotal;
    public $isCredit = False;

    function __construct($particulars, $date, $type, $amount, $isCredit,$flag,$inoviceTotal) {
        $this->particulars = $particulars;
        $this->amount = $amount;
        $this->isCredit = $isCredit;
		    $this->type = $type;
        $this->date = $date;
        $this->flag = $flag;
        $this->inoviceTotal = $inoviceTotal;
    }



}
