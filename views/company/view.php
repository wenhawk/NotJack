<?php

use yii\helpers\Html;
use app\models\Orders;
use app\models\Invoice;
use app\models\Payment;
use app\models\MyInvoice;
use app\models\OrderRate;
use yii\grid\GridView;
use yii\data\ActiveDataProvider;

?>
<div class="panel panel-default">
  <div class="panel-heading">Company Details</div>
  <div class="panel-body">
    <div class="row">
      <div class="col-md-4">
        <p> <strong>Company Name: </strong> <?= $model->name ?></p>
        <p></p>
      </div>
      <div class="col-md-4">
        <p> <strong>GSTIN:  </strong> <?= $model->gstin ?> <a href="index.php?r=company/update-gst&id=<?= $model->company_id ?>" >Edit</a></p>
        <p></p>
      </div>
      <div class="col-md-4">
        <p> <strong>Constitution: </strong> <?= $model->constitution ?></p>
        <h4></h4>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4">
        <p> <strong>Products: </strong> <?= $model->products ?></p>
        <p></p>
      </div>
      <div class="col-md-4">


            <?php
              if($model->url != ''){
                echo "<a href='$model->url'>Download GSTIN file</a>";
              }
            ?>

      </div>
      <div class="col-md-4">



      </div>
    </div>
    <div class="row">
      <div class="col-md-4">

            <?php
              if($model->tds_url != ''){
                echo "<p><a href='$model->tds_url'>Download TDS Document</a></p>";
              }
            ?>

      </div>
    </div>
  </div>
</div>


<div class="panel panel-default">
  <div class="panel-heading">
    <div class="row">
      <div class="col-md-6">
        Contact Details
      </div>
      <div class="col-md-6 text-right">
        <a href="index.php?r=company/update&id=<?= $model->company_id ?>"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
      </div>
    </div>

  </div>
  <div class="panel-body">
  <div class="row">
  <div class="col-md-3">
    <p> <strong>Contact Person: </strong> <?= $model->owner_name ?></p>
    <p></p>
  </div>
  <div class="col-md-3">
    <p> <strong>Phone No:  </strong> <?= $model->owner_phone ?></p>
    <p></p>
  </div>
  <div class="col-md-3">
    <p> <strong>Mobile No: </strong> <?= $model->user->mobile ?></p>
    <h4></h4>
  </div>
</div>
<div class="row">
  <div class="col-md-3">
    <p> <strong>Email: </strong> <?= $model->user->email ?></p>
    <h4></h4>
  </div>
  <div class="col-md-3">
    <p> <strong>Competent Person: </strong> <?= $model->competent_name ?></p>
    <h4></h4>
  </div>
  <div class="col-md-3">
    <p> <strong>Competent Person Mobile No: </strong> <?= $model->competent_mobile ?></p>
    <h4></h4>
  </div>
</div>
<div class="row">
  <div class="col-md-3">
    <p><strong>Competent Email: </strong> <?= $model->competent_email ?></p>
    <h4></h4>
  </div>
  <div class="col-md-3">
    <p><strong>Address: </strong> <?= $model->address ?></p>
    <h4></h4>
  </div>
  <?php if(Yii::$app->user->can('admin')){ ?>
    <div class="col-md-3">
      <p><strong>Remark: </strong> <?= $model->remark ?></p><?php
                if($model->remark_url != ''){
                  echo "<a href='$model->remark_url'>Download Remark</a>";
                }
              ?>
      <h4></h4>
    </div>
  <?php } ?>
</div>

  </div>
</div>


<div class="order-info">
  <?php
    if(is_array($orders)){
      foreach($orders as $order){
  ?>
    <div class="panel panel-default">
      <div class="panel-heading">

      <div class="row">
        <div class="col-md-6">
        <b> Plots:</b> <?= $order->plots; ?>
        <?php if ($order->shed_no != ""){ ?><b>Shed Number: </b><?= $order->shed_no ?><?php } ?>
          <?php if ($order->godown_no != ""){ ?><b>Godown Number: </b><?= $order->godown_no ?><?php } ?>
        </div>
        <div class="col-md-6">
          <div class="text-right">

            <b> Unit No:</b>  <?= $order->order_number ?> </p>
          </div>
        </div>
      </div>



       </div>
      <div class="panel-body-order panel-body">
      <?php
        if($order->status == 0){
            $transfer = Orders::findOne($order->next_order_id);
         ?>
            <div class="row" style="border: 1px solid black; padding: 20px;">
                <h3>Transfer Details</h3>
                <div class="col-md-6">
                    <p><b>Transfer Date: </b><?= $transfer->start_date; ?></p>
                </div>
                <div class="col-md-6">
                    <p><b>Transfered Company: </b><?= $transfer->company->name;?></p>
                </div>

            </div><br>
      <?php
       }
    ?>
      <div class="row">
        <div class="col-md-4">
          <p><b>
            <?php
              if(Yii::$app->user->can('company')){
                echo "Alloted Date";
              }else{
                echo "Date of allotment: ";
              }
            ?>
			</b>
		  <?php if(Yii::$app->user->can('admin')){
        $count = Orders::find()->where(['order_number' => $order->order_number])->count();
        if($count > 1){
          $date = Orders::find()->where(['order_number' => $order->order_number])->one()->start_date;
          echo date('d-m-Y', strtotime($date));
        }else{
          echo date('d-m-Y', strtotime($order->start_date));
        }
        ?><br></p>
        <?php
        if($count > 1){
          echo "<p><b>Transfer Date: </b>". date('d-m-Y', strtotime($order->start_date))."</p>";
        }
      }else{
          echo date('d-m-Y', strtotime($order->start_date));
            echo "<p><b>Transfer Date: </b> ------ </p>";
      }
		  ?>
          <?php
          $date = date('Y-m-d',strtotime($order->end_date.' - 30 days'));
          $diffDate = MyInvoice::getDateDifference($date);
          ?>
          <?php if($diffDate >= 0 ){ ?>
          <p  style="color:red"><b>Renewal Date: </b><?=  date('d-m-Y', strtotime($order->end_date)); ?></p><br>
         <?php } else { ?>
            <p  style="color:black"><b>Renewal Date: </b><?=  date('d-m-Y', strtotime($order->end_date)); ?></p><br>
         <?php } ?>
          <p><b>Company: </b><?= $order->company->name ?></p><br>
          <p><b>Industrial Area: </b><?= $order->area->name ?></p><br>
        </div>
        <div class="col-md-4">
          <p><b>Total Area: </b><?= $order->total_area ?></p><br>
          <?php if ($order->built_area != ""){ ?><p><b>Built Area: </b><?=  $order->built_area ?></p><?php } ?><br>
          <?php if ($order->shed_area != ""){ ?><p><b>Shed Area: </b><?= $order->shed_area ?></p><?php } ?><br>

        </div>
        <div class="col-md-4">
          <?php  if ($order->godown_area != ""){ ?><p><b>Godown Area: </b><?= $order->godown_area ?></p><?php } ?><br>
          <?php if ($order->godown_no != ""){ ?><p><b>Godown Number: </b><?= $order->godown_no ?></p><?php } ?><br>
          <?php if ($order->shed_no != ""){ ?><p><b>Shed Number: </b><?= $order->shed_no ?></p> <?php } ?> <br>
          <p><?php if(Yii::$app->user->can('admin') && $order->status == 1){ ?>
            <a href="index.php?r=invoice%2Fgenerate&order_id=<?= $order->order_id; ?>" class="btn btn-success">Generate Invoice</a>
            <?php }?>
          <?php if(Yii::$app->user->can('company') || Yii::$app->user->can('admin')){ ?>
            <a href="index.php?r=report%2Fledger&order_id=<?= $order->order_id; ?>" class="btn btn-success">Ledger Statment </a>
            <?php }?>
          </p>
        </div>
      </div>

      <h4><u>Invoices</u></h4>
      <?php
        $query = Invoice::find()->where(['order_id' => $order->order_id]);
        $provider = new ActiveDataProvider([
          'query' => $query,
          'pagination' => [
              'pageSize' => 10,
          ],
          'sort' => [
            'defaultOrder' => [
                'invoice_id' => SORT_DESC,
            ]
            ],
      ]);
      ?>
      <?=
        yii\grid\GridView::widget([
          'dataProvider' => $provider,
          'rowOptions'=>function($provider){
            if($provider->flag == '0'){
                return ['class' => 'danger'];
            }
          },
          'columns' => [
            'invoice_code',
            [
              'label' => 'Bill Amount',
              'value' => 'total_amount',
            ],
            [
              'label' => 'Invoice Bill Date',
              'value' => function($provider){
                  return date('d-m-Y', strtotime($provider->start_date));
              }
            ],
            [
              'class' => 'yii\grid\ActionColumn',
              'header' => 'Actions',
              'headerOptions' => ['style' => 'color:#337ab7'],
              'template' => '{view}',
              'buttons' => [
                'view' => function ($url, $model) {
                    return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                'title' => Yii::t('app', 'lead-view'),
                    ]);
                },



              ],
              'urlCreator' => function ($action, $provider, $key, $index) {
                  if ($action === 'view') {
                      $url ='index.php?r=invoice%2Fview&id='.$provider['invoice_id'];
                      return $url;
                  }

                  }
          ],
          ]
      ]);

      ?>
      <h4><u>Receipts</u></h4>
      <?php
        $query = Payment::find()->where(['order_id' => $order->order_id])->andWhere(['status' => 1]);
        $provider = new ActiveDataProvider([
          'query' => $query,
          'pagination' => [
              'pageSize' => 10,
          ],
          'sort' => [
            'defaultOrder' => [
                'payment_id' => SORT_DESC,
            ]
          ],
      ]);
      ?>
      <?=
        yii\grid\GridView::widget([
          'dataProvider' => $provider,
          'rowOptions'=>function($provider){
            if($provider->status == '0'){
                return ['class' => 'danger'];
            }
          },
          'columns' => [
            'amount',
            [
              'label' => 'Start Date',
              'value' => function($provider){
                  return date('d-m-Y', strtotime($provider->start_date));
              }
            ],
            'mode',
            'invoice.invoice_code',
            [
              'class' => 'yii\grid\ActionColumn',
              'header' => 'Actions',
              'headerOptions' => ['style' => 'color:#337ab7'],
              'template' => '{view}',
              'buttons' => [
                'view' => function ($url, $model) {
                    return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                'title' => Yii::t('app', 'lead-view'),
                    ]);
                },



              ],
              'urlCreator' => function ($action, $provider, $key, $index) {
                  if ($action === 'view') {
                      $url ='index.php?r=payment%2Fview&id='.$provider['payment_id'];
                      return $url;
                  }

                  }
          ],
          ]
      ]);
      ?>


      <?php
        if(Yii::$app->user->can('admin')){
          echo "<h4> <u>Lease Rent</u> </h4>";
        $query = OrderRate::find()->where(['order_id' => $order->order_id]);
        $provider = new ActiveDataProvider([
          'query' => $query,
          'pagination' => [
              'pageSize' => 10,
          ],
      ]);
      ?>
    <?= GridView::widget([
        'dataProvider' => $provider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
              'label' => 'Start Date',
              'value' => function($provider){
                  return date('d-m-Y', strtotime($provider->start_date));
              }
            ],
            [
              'label' => 'End Date',
              'value' => function($provider){
                  return date('d-m-Y', strtotime($provider->end_date));
              }
            ],

            [
              'label' => 'Lease Rent',
              'value' => 'amount1',
          ],
          [
              'label' => 'Increment',
              'value' => 'amount2',
          ],
            [
                'attribute' => 'flag',
                'value' => function($dataProvider){
                    if($dataProvider->flag == '1'){
                        return 'Current';
                    }else{
                        return 'Old';
                    }
                }
            ],
            [
              'class' => 'yii\grid\ActionColumn',
              'header' => 'Actions',
              'headerOptions' => ['style' => 'color:#337ab7'],
              'template' => '{view}{update}{delete}',
              'buttons' => [
                'view' => function ($url, $provider) {
                    return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                'title' => Yii::t('app', 'lead-view'),
                    ]);
                },

                'update' => function ($url, $provider) {
                    return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                'title' => Yii::t('app', 'lead-update'),
                    ]);
                },


              ],
              'urlCreator' => function ($action, $provider, $key, $index) {
                  if ($action === 'view') {
                      $url ='/gidc/web/index.php?r=order-rate%2Fupdate&id='.$provider['order_rate_id'];
                      return $url;
                  }

                  if ($action === 'update') {
                      //$url=$this->createUrl('state/view',['id' => $model['state_code']]);
                      $url ='/gidc/web/index.php?r=order-rate%2Fupdate&id='.$provider['order_rate_id'];
                      return $url;
                  }

                  }
          ],
        ],
    ]); ?>

        <?php } ?>

      </div>
    </div>
  <?php } }else{ ?>
    <div class="panel panel-default">
      <div class="panel-heading">Unit No: <?= $orders->order_number ?></div>
      <div class="panel-body">
        Panel content
      </div>
    </div>
  <?php } ?>

</div>


<?php

    $script = <<< JS
      $(document).ready(function(){

        $('.panel-body-order').hide();
        $('.panel-heading').click(function(){
          console.log("clik=cl");
          $(this).next().slideToggle();
        });

      });
JS;

    $this->registerJS($script);
?>
