<?php 

namespace app\models;

use Yii;

class Mail extends \yii\base\Model{
    public $serverLocation = 'http::localhost/gidc/';
    public $sentFrom = 'castorgodinho22@gmail.com';

    public function sendMail($id){
        if (\Yii::$app->user->can('admin')){
            $model = Invoice::findOne($id);
            $interest = $model->interest->rate;
            $toDate = date('d-m-Y', strtotime($model->lease_current_start. ' + 1 year - 1 day'));
            $msg = "Dear Customer \n\nYour Lease Rent form the period $model->lease_current_start - $toDate ".
                "is due on $model->due_date.I kindly request you to pay the same on or before due".
                 " date.delay payment will charge $interest% penal interest on daily basis.".
                "Please find copy of invoice for more details.\n\n".$this->serverLocation."/web/index.php?r=invoice%2Fview&id=".$model->invoice_id;
            $status = 0;
            try{
                $status = Yii::$app->mailer->compose()
                    ->setFrom($this->sentFrom)
                    ->setTo($model->order->company->user->email)
                    ->setSubject('IDC Goa')
                    ->setTextBody($msg)
                    ->send();
            }catch(\Swift_TransportException $e){
                $response = $e->getMessage() ;
            }catch(\Exception $e){
                 echo "Mail failed";
            }
            $model->email_status = $status;
            $model->save(false);
        }else{
            throw new \yii\web\ForbiddenHttpException;
        }
    }
}

?>