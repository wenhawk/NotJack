<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Area */

$this->title = 'Create Industrial Estate';
$this->params['breadcrumbs'][] = ['label' => 'Areas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="area-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
