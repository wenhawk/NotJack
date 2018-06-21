<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "orders".
 *
 * @property int $order_id
 * @property string $order_number
 * @property int $company_id
 * @property int $built_area
 * @property int $shed_area
 * @property int $godown_area
 * @property string $start_date
 * @property string $end_date
 * @property string $shed_no
 * @property string $godown_no
 * @property int $area_id
 * @property int $total_area
 * @property string $plots
 * @property string $document
 * @property string $remark
 * @property int $status
 * @property int $next_order_id
 * @property string $transfer_url
 * @property int $email_status
 * @property string $due_date
 * @property string $tansfer_date
 * @property string $folio1
 * @property string $folio2
 *
 * @property Debit[] $debits
 * @property Invoice[] $invoices
 * @property OrderDetails[] $orderDetails
 * @property Plot[] $plots0
 * @property OrderRate[] $orderRates
 * @property Area $area
 * @property Orders $nextOrder
 * @property Orders[] $orders
 * @property Company $company
 * @property Payment[] $payments
 */
class Orders extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'orders';
    }
    public $file;
    public $transfer_file;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['order_number', 'company_id'], 'required'],
            [['company_id', 'built_area', 'shed_area', 'godown_area', 'area_id', 'total_area', 'status', 'next_order_id', 'email_status'], 'integer'],
            [['start_date', 'end_date', 'due_date', 'tansfer_date','total_area', 'plots'], 'safe'],
            [['document', 'remark', 'transfer_url', 'folio1', 'folio2'], 'string'],
            [['order_number'], 'string', 'max' => 20],
            [['shed_no', 'godown_no'], 'string', 'max' => 50],
            [['plots'], 'string', 'max' => 100],
            [['area_id'], 'exist', 'skipOnError' => true, 'targetClass' => Area::className(), 'targetAttribute' => ['area_id' => 'area_id']],
            [['next_order_id'], 'exist', 'skipOnError' => true, 'targetClass' => Orders::className(), 'targetAttribute' => ['next_order_id' => 'order_id']],
            [['company_id'], 'exist', 'skipOnError' => true, 'targetClass' => Company::className(), 'targetAttribute' => ['company_id' => 'company_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'order_id' => 'Order ID',
            'order_number' => 'Order Number',
            'company_id' => 'Company ID',
            'built_area' => 'Built Area',
            'shed_area' => 'Shed Area',
            'godown_area' => 'Godown Area',
            'start_date' => 'Start Date',
            'end_date' => 'End Date',
            'shed_no' => 'Shed No',
            'godown_no' => 'Godown No',
            'area_id' => 'Area ID',
            'total_area' => 'Total Area',
            'plots' => 'Plots',
            'document' => 'Document',
            'remark' => 'Remark',
            'status' => 'Status',
            'next_order_id' => 'Next Order ID',
            'transfer_url' => 'Transfer Url',
            'email_status' => 'Email Status',
            'due_date' => 'Due Date',
            'tansfer_date' => 'Tansfer Date',
            'folio1' => 'Folio1',
            'folio2' => 'Folio2',
        ];
    }



    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDebits()
    {
        return $this->hasMany(Debit::className(), ['order_id' => 'order_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInvoices()
    {
        return $this->hasMany(Invoice::className(), ['order_id' => 'order_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderDetails()
    {
        return $this->hasMany(OrderDetails::className(), ['order_id' => 'order_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlots0()
    {
        return $this->hasMany(Plot::className(), ['plot_id' => 'plot_id'])->viaTable('order_details', ['order_id' => 'order_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderRates()
    {
        return $this->hasMany(OrderRate::className(), ['order_id' => 'order_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArea()
    {
        return $this->hasOne(Area::className(), ['area_id' => 'area_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNextOrder()
    {
        return $this->hasOne(Orders::className(), ['order_id' => 'next_order_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(Orders::className(), ['next_order_id' => 'order_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompany()
    {
        return $this->hasOne(Company::className(), ['company_id' => 'company_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPayments()
    {
        return $this->hasMany(Payment::className(), ['order_id' => 'order_id']);
    }

    public function upload()
    {
            $this->document = 'unit_documents/' . $this->file->baseName . '.' . $this->file->extension;
            $this->file->saveAs('unit_documents/' . $this->file->baseName . '.' . $this->file->extension);
            echo $this->document;


    }

    public function uploadTranfer(){
        $this->transfer_url = 'unit_documents/' . $this->transfer_file->baseName . '.' . $this->transfer_file->extension;
        $this->transfer_file->saveAs('unit_documents/' . $this->transfer_file->baseName . '.' . $this->transfer_file->extension);
        return true;
    }
}
