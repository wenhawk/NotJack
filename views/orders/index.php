<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchOrders */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Unit List';
?>
<div class="orders-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('New Unit', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'order_number',
            'company.name',
            /* 'plot_id', */
            /* 'built_area',*/
            /* 'shed_area', */
            // 'godown_area',
            [
                'label' => 'Alloted Date',
                'value' => function($dataProvider){
                    return date('d-m-Y', strtotime($dataProvider->start_date));
                }
            ],
            [
                'label' => 'Email Status',
                'attribute' => 'email_status',
                'value' => function($dataProvider){
                    if($dataProvider->email_status == '1'){
                      return 'ON';
                    }else{
                      return 'OFF';
                    }
                }
            ],
            [

            'format' => 'html',
            'value' => function ($model) {
              if($model->email_status == '1'){
                return '<a class="btn btn-danger" href="index.php?r=orders%2Ftoggle-email-status&id='.$model->order_id.'">OFF</a>';
              }else{
                return '<a class="btn btn-success" href="index.php?r=orders%2Ftoggle-email-status&id='.$model->order_id.'">ON</a>';
              }
            },
            ],


            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
