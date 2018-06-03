<?php
    use app\models\Ledger;
    use yii\helpers\Html;
?>

<center><h1>Monthly Report</h1></center>

<?php $form = Html::beginForm(); ?>
<form action="<?=  \Yii::$app->request->BaseUrl ?>/index.php?r=report%2Fmonth" method="POST">
<input type="hidden" name="_csrf" value="<?=Yii::$app->request->getCsrfToken()?>" />
<?php if(Yii::$app->user->can('admin') || Yii::$app->user->can('accounts')){?>
  <input  placeholder="ENTER YEAR" name="year" class="form-control">
<?php } ?>
