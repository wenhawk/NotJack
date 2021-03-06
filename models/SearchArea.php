<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Area;

/**
 * SearchArea represents the model behind the search form of `app\models\Area`.
 */
class SearchArea extends Area
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['area_id', 'total_area', 'rate'], 'integer'],
            [['name', 'flag'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Area::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'area_id' => $this->area_id,
            'total_area' => $this->total_area,
            'rate' => $this->rate,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'flag', $this->flag]);
        $query->andWhere(['flag' => '1']);
        $query->orderBy(['flag' => SORT_DESC]);

        return $dataProvider;
    }
}
