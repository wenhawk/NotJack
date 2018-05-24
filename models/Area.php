<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "area".
 *
 * @property int $area_id
 * @property string $name
 * @property int $total_area
 * @property int $rate
 * @property int $flag
 *
 * @property Orders[] $orders
 * @property Plot[] $plots
 */
class Area extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'area';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['total_area', 'rate'], 'integer'],
            [['rate', 'flag'], 'required'],
            [['name'], 'string', 'max' => 100],
            [['flag'], 'string', 'max' => 4],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'area_id' => 'Industrial Estate',
            'name' => 'Area',
            'total_area' => 'Total Area',
            'rate' => 'Rate',
            'flag' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(Orders::className(), ['area_id' => 'area_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlots()
    {
        return $this->hasMany(Plot::className(), ['area_id' => 'area_id']);
    }
}
