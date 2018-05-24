<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Rate */

$this->title = $model->rate_id;
$this->params['breadcrumbs'][] = ['label' => 'Rates', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rate-view">

    <h1><?= Html::encode($this->title) ?></h1>



    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'rate_id',
            'area_id',
            'rate',
			[
				'label' => 'Date',
				'value' => function($model){
					return date('d m Y', strtotime($model->date));
				}
			],
        ],
    ]) ?>

</div>
