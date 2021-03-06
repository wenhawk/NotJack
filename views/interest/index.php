<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchInterest */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Interests';
?>
<div class="interest-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Interest', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

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

            'name',
            'type',
            'rate',
			[
				'label' => 'From Date',
				'attribute' => 'start_date',
				'value' => function($dataProvider){
					return date('d-m-Y', strtotime($dataProvider->start_date));
				}
			],
        [
          'label' => 'Status',
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
