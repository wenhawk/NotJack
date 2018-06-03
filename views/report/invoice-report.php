<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Payment;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchInvoice */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<div class="invoice-index">


    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-md-2">
            <?= $form->field($model, 'from_date')->widget(\yii\jui\DatePicker::classname(), [
        'options' => [
          'class' => 'form-control'
        ],
        'language' => 'en',
        'dateFormat' => 'yyyy-MM-dd',
    ])  ?>
        </div>
        <div class="col-md-2">
            <?= $form->field($model, 'to_date')->widget(\yii\jui\DatePicker::classname(), [
        'options' => [
          'class' => 'form-control'
        ],
        'language' => 'en',
        'dateFormat' => 'yyyy-MM-dd',
    ])  ?>
        </div>
        <div class="col-md-2">
            <?= $form->field($model, 'search_key')->textInput(); ?>
        </div>
    </div>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'invoice_code',
            [
              'label' => 'Plot No.',
              'value' => function($dataProvider){
                  return $dataProvider->order->plots;
              }
            ],
			[
				'label' => 'Bill Date',
				'attribute' => 'start_date',
				'value' => function($dataProvider){
					return date('d-m-Y', strtotime($dataProvider->start_date));
				}
			],
            'order.order_number',
            'order.company.name',
            [
                'label' => 'Lease Rent (INR)',
                'attribute' => 'current_lease_rent',
            ],
            [
                'label' => 'Grand Total (INR)',
                'attribute' => 'total_amount',
            ],

            [
                'label' => 'Amount Paid',
                'value' => function ($dataProvider) {
                    $amount = Payment::find()->where(['invoice_id' => $dataProvider->invoice_id])->andWhere(['status' => 1])->sum('amount');

                    if($amount == '')
                     return 0;
                    else
                        return $amount;
                },
            ],
            [
                'label' => 'Balance',
                'value' => function ($dataProvider) {
                    $amount = Payment::find()->where(['invoice_id' => $dataProvider->invoice_id])->andWhere(['status' => 1])->sum('amount');

                    if($amount == '')
                     return $dataProvider->total_amount;
                    else
                        return $dataProvider->total_amount - $amount;
                },
            ],
            [
                'label' => 'Email',
                'value' => function ($dataProvider){
                    if($dataProvider->email_status == 1){
                        return "Sent";
                    }else{
                        return 'Not Sent';
                    }

                }
            ],
            //'start_date',
            //'total_amount',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
