<?php
    use app\models\Ledger;
    use yii\helpers\Html;
?>

<h1>Ledger</h1>

<?php $form = Html::beginForm(); ?>
<form action="<?=  \Yii::$app->request->BaseUrl ?>/index.php?r=report%2Fledger" method="POST">
<input type="hidden" name="_csrf" value="<?=Yii::$app->request->getCsrfToken()?>" />
<?php if(Yii::$app->user->can('admin') || Yii::$app->user->can('accounts')){?>
<div class="row">
    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
        <?= Html::label('From Date', 'xxx') ?>
        <?=  \yii\jui\DatePicker::widget([
            'name'  => 'from_date',
            'value'  => '',
            'options' => [
                'class' => 'form-control',
            ],
            //'language' => 'ru',
            'dateFormat' => 'yyyy-MM-dd',
        ]);?>
    </div>
    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
        <?= Html::label('To Date', 'xxx') ?>
        <?=  \yii\jui\DatePicker::widget([
            'name'  => 'to_date',
            'value'  => '',
            'options' => [
                'class' => 'form-control',
            ],
            //'language' => 'ru',
            'dateFormat' => 'yyyy-MM-dd',
        ]);?>
    </div>
    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
        <br>
        <input type="text" class="form-control" name="order_number" placehoder="Order Number">
    </div>
    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
        <br>
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
    </div>
</div>
        <?php } ?>
</form>
<h3> <?= $to ?> -  <?= $from ?></h3>
<br>
<br>
<table class="table table-bordered">
    <thead>
        <td>Sr. No</td>
        <td>Particulars</td>
        <td>Date</td>
		    <td>Voucher Type</td>
        <td>Debit</td>
        <td>Credit</td>
        <td>Total Invoice Amount</td>
    </thead>
    <?php
        $status = True;
        $invoice_i = 0;
        $payment_i = 0;
        $led = array();
        $invoice_total = 0;
        $payment_total = 0;
        foreach($invoice as $in){
            array_push($led, new Ledger($in->invoice_code, $in->start_date, 'Invoice',$in->current_dues_total , True,$in->flag ,$in->total_amount ));
            $invoice_total += $in->total_amount;
        }
        foreach($payment as $pay){
            array_push($led, new Ledger($pay->payment_no, $pay->start_date, 'Receipt', $pay->amount, False,$pay->status, 0));
            $payment_total += $pay->amount;
        }
        foreach($debit as $deb){
                $date=date('d-m-Y',strtotime($deb->invoice->start_date));
                array_push($led, new Ledger($deb->debit_id, $date , 'Debit Note',$deb->penal, True , $deb->flag,0));
                $invoice_total += $deb->penal;
        }
        function cmp($a, $b)
        {
            return strcmp($a->date, $b->date);
        }

        usort($led, "cmp");
        $debitTotal = 0;
        $creditTotal = 0;
        $sr_no = 1;
        foreach($led as $record){
            $creditAmount = 0;
            $debitAmount = 0;
            if($record->isCredit){
              if($record->flag == '1'){
                $debitAmount = $record->amount;
                $debitTotal += $debitAmount;
              }
            }else{
              if($record->flag == '1'){
                  $creditAmount = $record->amount;
                  $creditTotal += $creditAmount;
              }
            }
            $amountC = 0;
            $amountD = 0;
            if($record->type == 'Receipt'){
              $amountC = $record->amount;
            }else{
              $amountD = $record->amount;;
            }

        if($record->flag == '1'){
          if($record->type == 'Invoice'){
            echo "<tr> <td>$sr_no</td> <td>". $record->particulars ."</td> <td>".date('d-m-Y',strtotime($record->date)) ."</td><td>". $record->type."</td><td>$amountD</td><td>$amountC</td><td>".$record->inoviceTotal."</td></tr>";
          }else{
            if($record->type == 'Debit Note'){
              echo "<tr> <td>$sr_no</td> <td>DEBIT/000". $record->particulars ."</td> <td>".date('d-m-Y',strtotime($record->date)) ."</td><td>". $record->type."</td><td>$amountD</td><td>$amountC</td>td>".$record->inoviceTotal."</td></tr>";
            }else{
              echo "<tr> <td>$sr_no</td> <td>". $record->particulars ."</td> <td>".date('d-m-Y',strtotime($record->date)) ."</td><td>". $record->type."</td><td>$amountD</td><td>$amountC</td>td>".$record->inoviceTotal."</td></tr>";
            }

          }

        }else{
          if($record->type == 'Debit Note'){
            echo "<tr> <td>$sr_no</td> <td>DEBIT/000". $record->particulars ."</td> <td>".date('d-m-Y',strtotime($record->date)) ."</td><td>". $record->type." JV </td><td>$amountD</td><td>$amountC</td>td>".$record->inoviceTotal."</td></tr>";
          }else{
            echo "<tr> <td>$sr_no</td> <td>". $record->particulars ."</td> <td>".date('d-m-Y',strtotime($record->date)) ."</td><td>". $record->type." JV </td><td>$amountD</td><td>$amountC</td>td>".$record->inoviceTotal."</td></tr>";
          }

        }
            $sr_no = $sr_no + 1;
        }
        $outstanding = ($debitTotal - $creditTotal);
        echo "<tr> <td>#</td><td></td> <td>Balance Due</td> <td> </td><td></td><td>". $outstanding ."</td></tr>";
        echo "<tr> <td>#</td><td></td> <td>Total</td> <td> </td><td>". $debitTotal ."</td><td>". ($outstanding + $creditTotal) ."</td></tr>";
    ?>
</table>
