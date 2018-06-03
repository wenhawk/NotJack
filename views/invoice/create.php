<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Rate;
use app\models\Tax;
use app\models\Interest;
use app\models\Orders;
use kartik\select2\Select2;

$tax = Tax::find()->where(['flag' => '1'])->all();
$interest = Interest::find()->where(['flag' => '1'])->all();
$order = Orders::find()->where(['status' => '1'])->all();

?>
<div class="invoice-create">
  <center>
    <h1>Manual Invoice</h1>
  </center>
  <?php $form = ActiveForm::begin(); ?>

    <table class="table table-responsive">
      <tr>
        <td > Unit Code: </td>
        <td ><?php
            echo $form->field($model, 'order_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map($order, 'order_id', 'order_number'),
                'language' => 'de',
                'options' => ['placeholder' => 'Select A Unit'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
        ?></td>
      </tr>
      <tr>
        <td > Penal Interest Rate % : </td>
        <td ><?= $form->field($model, 'interest_id')->dropDownList(ArrayHelper::map($interest, 'interest_id', 'rate'))->label(false); ?></td>
      </tr>

      <?= $form->field($model, 'penalAmount')->textInput()->label(false)->hiddenInput(); ?>

      <tr>
        <td > GST Rate : </td>
        <td ><?= $form->field($model, 'tax_id')->dropDownList(ArrayHelper::map($tax, 'tax_id', 'rate'))->label(false); ?></td>
      </tr>
      <tr>
        <td > Invoice Code: </td>
        <td ><?= $form->field($model, 'invoice_code')->textInput()->label(false) ?></td>
      </tr>
      <tr>
        <td colspan='2'><h3><b>1. Previous Dues Description: (B)</b></h3></td>
      </tr>
      <tr>
        <td class='bold-text'>  Previous Lease Period From Date:  </td>
        <td> <?= $form->field($model, 'lease_prev_start')->widget(\yii\jui\DatePicker::classname(), [
            'options' => [
              'class' => 'form-control'
            ],
            'language' => 'en',
            'dateFormat' => 'yyyy-MM-dd',
        ])->label(false) ?></td>
      </tr>

      <tr>
        <td class='bold-text'>  Previous Lease Period To Date:  </td>
        <td> <?= $form->field($model, 'lease_prev_end')->widget(\yii\jui\DatePicker::classname(), [
            'options' => [
              'class' => 'form-control'
            ],
            'language' => 'en',
            'dateFormat' => 'yyyy-MM-dd',
        ])->label(false) ?></td>
      </tr>

      <tr>
        <td class='bold-text'>Previous Lease Rent (INR): SAC Code: 9972</td>
        <td>  <?= $form->field($model, 'prev_lease_rent')->textInput()->label(false) ?>  </td>
      </tr>

      <tr>
        <td class='bold-text'>Total Tax (INR):</td>
        <td> <?= $form->field($model, 'prev_tax')->textInput()->label(false) ?> </td>
      </tr>

      <tr>
        <td class='bold-text'> Penal Interest (INR): </td>
        <td><?= $form->field($model, 'prev_interest')->textInput()->label(false) ?></td>
      </tr>
      <tr>
        <td class='bold-text'>  Previous Due Description (A) (INR): </td>
        <td> <?= $form->field($model, 'prev_dues_total')->textInput()->label(false) ?> </td>
      </tr>
      <tr>
        <td colspan='2'><h3><b>2. Current Dues Description (B):</b></h3></td>
      </tr>
      <tr>
        <td class='bold-text'>Lease Period:  </td>
        <td> <?= $form->field($model, 'lease_current_start')->widget(\yii\jui\DatePicker::classname(), [
            'options' => [
              'class' => 'form-control'
            ],
            'language' => 'en',
            'dateFormat' => 'yyyy-MM-dd',
        ])->label(false) ?></td>
      </tr>

      <tr>
        <td class='bold-text'>Lease Rent (INR): SAC Code: 9972: </td>
        <td> <?= $form->field($model, 'current_lease_rent')->textInput()->label(false) ?>  </td>
      </tr>

      <tr>
        <td class='bold-text'>Total Tax (INR): </td>
        <td> <?= $form->field($model, 'current_tax')->textInput()->label(false) ?>  </td>
      </tr>

      <tr>
        <td class='bold-text'>  Current Due Description (B) (INR): </td>
        <td> <?= $form->field($model, 'current_dues_total')->textInput()->label(false) ?>  </td>
      </tr>

      <tr>
        <td class='bold-text'>  Total Dues ( C = A + B) (INR): </td>
        <td> <?= $form->field($model, 'total_amount')->textInput()->label(false) ?>  </td>
      </tr>
      <tr>
        <td class='bold-text'>  Due Date: </td>
        <td> <?= $form->field($model, 'due_date')->widget(\yii\jui\DatePicker::classname(), [
            'options' => [
              'class' => 'form-control'
            ],
            'language' => 'en',
            'dateFormat' => 'yyyy-MM-dd',
        ])->label(false) ?> </td>
      </tr>
      <tr>
        <td class='bold-text'>  Bill Date: </td>
        <td> <?= $form->field($model, 'start_date')->widget(\yii\jui\DatePicker::classname(), [
            'options' => [
              'class' => 'form-control'
            ],
            'language' => 'en',
            'dateFormat' => 'yyyy-MM-dd',
        ])->label(false) ?> </td>
      </tr>


    </table>
  </div>



<center>
      <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
</center>

  <?php ActiveForm::end(); ?>



</div>
