<?php

namespace app\controllers;

use Yii;
use app\models\Rate;
use app\models\Payment;
use app\models\SearchRate;
use app\models\Log;
use app\models\Debit;
use yii\helpers\Json;
use yii\web\Controller;
use app\models\Orders;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Invoice;
use app\models\InvoiceReport;
use app\models\InvoiceSearchData;


/**
 * RateController implements the CRUD actions for Rate model.
 */
class ReportController extends Controller
{
    public function actionInvoiceReport(){
        if (\Yii::$app->user->can('viewInvoiceReport')){
            $model = new InvoiceSearchData();
            if($model->load(Yii::$app->request->post())){
                $dataProvider = '';
                $searchModel = new InvoiceReport();
                $searchModel->from_date = $model->from_date;
                $searchModel->to_date = $model->to_date;
                $searchModel->search_key = $model->search_key;
                $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            }else{
                echo "didngt load";
                $searchModel = new InvoiceReport();
                $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            }
            return $this->render('invoice-report', [
                'dataProvider' => $dataProvider,
                'model' => $model,
            ]);

        }else{
            throw new \yii\web\ForbiddenHttpException;
        }
    }

    public function actionView($id)
    {
        return $this->redirect([
            'invoice/view', 'id' => $id
        ]);
    }

    public function actionRenewal()
    {
      $orders = null;
      $message = 'No Records Found';
      $post  = False;
      if(Yii::$app->request->post()){
          $to = Yii::$app->request->post('to_date');
          $from = Yii::$app->request->post('from_date');
          $orders = Orders::find()
          ->where(['between','end_date',$from,$to])
          ->all();
          $post = True;
        }

        return $this->render('renewal',[
          'orders' => $orders,
          'message' => $message,
          'post' => $post
        ]);
    }

    public function actionLedger()
    {
        $order_id = 0;
        if(Yii::$app->request->get()){
            $order_id = Yii::$app->request->get('order_id');
        }
        if (\Yii::$app->user->can('viewLedgerReport', ['order_id' => $order_id ])){
            $invoice = '';
            $payment = '';
            $debit = '';
            $to = 'Records';
            $from = 'All';
            if(Yii::$app->request->post()){
                echo "Here";
                $to = Yii::$app->request->post('to_date');
                $from = Yii::$app->request->post('from_date');
                $order_number = Yii::$app->request->post('order_number');

                if($to != '' && $from != ''){
                    echo 'Query with dates';
                    $invoice = Invoice::find()->orderBy('invoice.start_date')
                    ->where(['between', 'invoice.start_date', $from, $to ]);
                    $payment = Payment::find()->orderBy('payment.start_date')
                    ->where(['between', 'payment.start_date', $from, $to ]);
                    $debit = Debit::find()->orderBy('debit.start_date')
                    ->where(['between', 'debit.start_date', $from, $to ]);
                }else{
                    echo 'Query without dates';
                    $invoice = Invoice::find()->orderBy('invoice.start_date');
                    $payment = Payment::find()->orderBy('payment.start_date');
                    $debit = Debit::find()->orderBy('debit.start_date');
                }
                if($order_number != ""){
                    $invoice->joinWith('order');
                    $payment->joinWith('order');
                    $invoice->andFilterWhere(['like', 'order_number', $order_number]);
                    $payment->andFilterWhere(['like', 'order_number', $order_number]);

                    $invoice = $invoice->all();
                    $payment = $payment->all();
                    $order_id = 0;
                    foreach($invoice as $in){
                        $order_id = $in->order_id;
                    }
                    $debit->andFilterWhere(['order_id' => $order_id]);
                    $debit = $debit->all();
                }else{
                    $invoice = $invoice->all();
                    $payment = $payment->all();
                    $debit = $debit->all();
                }
            }else if(Yii::$app->request->get('order_id')){
                $order_number = Yii::$app->request->get('order_id');
                echo 'only';
                $invoice = Invoice::find()->where(['order_id' => $order_number])->all();
                $payment = Payment::find()->where(['order_id' => $order_number])->all();
                $order_id = 0;
                foreach($invoice as $in){
                    $order_id = $in->order_id;
                }
                $debit = Debit::find()->where(['order_id' => $order_id])->all();
            }else{
                echo 'Normal';
                $invoice = Invoice::find()->orderBy('start_date')->all();
                $payment = Payment::find()->orderBy('start_date')->all();
                $debit = Debit::find()->all();
            }
            return $this->render(
                'ledger',
                [
                    'invoice' => $invoice,
                    'payment' => $payment,
                    'debit' => $debit,
                    'to' => $to,
                    'from' => $from,
                ]
            );
        }else{
            throw new \yii\web\ForbiddenHttpException;
        }

    }
}
