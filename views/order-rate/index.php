<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchOrderRate */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Order Rates';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-rate-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
			[
				'label' => 'From Date',
				'attribute' => 'start_date',
				'value' => function($dataProvider){
					return date('d-m-Y', strtotime($dataProvider->start_date));
				}
			],
			[
				'label' => 'To Date',
				'attribute' => 'start_date',
				'value' => function($dataProvider){
					return date('d-m-Y', strtotime($dataProvider->end_date));
				}
			],
            'amount1',
            'amount2',

            [
                'attribute' => 'order_id',
                'value' => 'order.order_number',

            ],
            [
                'label' => 'Status',
                'attribute' => 'flag',
                'value' => function($dataProvider){
                    if($dataProvider->flag == '1'){
                        return 'Active';
                    }else{
                        return 'In-Active';
                    }
                }
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
