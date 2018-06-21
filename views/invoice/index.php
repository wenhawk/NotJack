<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchInvoice */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Invoices';
?>
<div class="invoice-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'rowOptions'=>function($dataProvider){
          if($dataProvider->flag == '0'){
              return ['class' => 'danger'];
          }
        },
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'invoice_code',
            'order.order_number',
            [

                'attribute' =>'order_id',
                'label' => 'Company',
                'value' =>  'order.company.name',
            ],

            [
                'label' => 'Email',
                'value' => function($dataProvider){
                    if($dataProvider->email_status == 1){
                        return "Sent";
                    }else{
                        return "Not Sent";
                    }
                }
            ],

            ['class' => 'yii\grid\ActionColumn',
            'visibleButtons' => [
              'update' => Yii::$app->user->can('update'),
            ]],
        ],
    ]); ?>
</div>
