<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Log */

$this->title = 'Update Log: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->log_id, 'url' => ['view', 'id' => $model->log_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="log-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
