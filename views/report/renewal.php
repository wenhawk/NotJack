<?php
    use app\models\Ledger;
    use yii\helpers\Html;
?>

<h1>Renewal</h1>

<?php $form = Html::beginForm(); ?>
<form action="<?=  \Yii::$app->request->BaseUrl ?>/index.php?r=report%2Frenewal" method="POST">
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
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
    </div>
</div>
        <?php } ?>
</form>
<br>
<br>
<?php if($orders) { ?>
  <table class="table">
    <th>Unit ID</th>
    <th>Company Name</th>
    <th>Renewal</th>
    <th>Alloted Date</th>

    <?php foreach($orders as $order){ ?>
      <tr>
        <td><?= $order->order_number ?></td>
        <td><?= $order->company->name ?></td>
        <td><?= date('d-m-Y',strtotime($order->end_date.'')) ?></td>
        <td><?= date('d-m-Y',strtotime($order->start_date.'')) ?></td>
      </tr>

    <?php } ?>
  </table>

<?php } ?>
