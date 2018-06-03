<?php
namespace app\models;

use Yii;

class Ledger extends \yii\base\Model
{

    /**
     *
     * @inheritdoc
     */
    public $id;
    public $particulars;
    public $amount;
    public $date;
	  public $type;
	  public $flag;
	  public $inoviceTotal;
    public $isCredit = False;
    public $mode;

    function __construct($id,$particulars, $date, $type, $amount, $isCredit,$flag,$inoviceTotal,$mode) {
        $this->particulars = $particulars;
        $this->mode = $mode;
        $this->id = $id;
        $this->amount = $amount;
        $this->isCredit = $isCredit;
		    $this->type = $type;
        $this->date = $date;
        $this->flag = $flag;
        $this->inoviceTotal = $inoviceTotal;
    }



}
