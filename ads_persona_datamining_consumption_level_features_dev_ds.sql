# --------------------------------------------------------------------------------------------------------
#  @FileName: ads_persona_datamining_consumption_level_features_dev_ds.sql
#  @CopyRight: copyright(c)huawei technologies co.,ltd.1998-2016.all rights reserved.
#  @Purpose: 预测用户消费能力的训练数据
#  @Describe: 用户信息（价格、常驻城市、年龄、性别）
#  @Input: ads_persona_label_0level_v3_price_dev_ds,ads_persona_label_0level_v3_forecast_age_ds,ads_persona_label_0level_v3_gender_ds,ads_persona_label_0level_v3_residence_new_ds,ads_persona_upid_devid_to_personid_ds
#  @Output: ads_persona_datamining_consumption_level_features_dev_ds
#  @Author: h84108439
#  @Version: Cloud Persona 3.5.2
#  @Create: 2018-08-11
#  @Modify: 
# ---------------------------------------------------------------------------------------------------------

beeline -e "
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
use biads;


CREATE EXTERNAL TABLE IF NOT EXISTS ads_persona_datamining_consumption_level_features_dev_ds
(
    imei                STRING COMMENT '设备编号'
    ,shop_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,pay_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,finance_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,bank_app_usage_duration            DOUBLE COMMENT '使用时长'
    ,travel_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,carUsage_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,house_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,takeout_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,carInfo_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,stock_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,carRaising_app_usage_duration          DOUBLE COMMENT '使用时长'
    ,price_dev          STRING COMMENT '机型价格'
    ,city               STRING COMMENT '常驻城市'
    ,tvlr_hobby_dev             STRING COMMENT '旅游'
    ,bsn_tvlr_dev               STRING COMMENT '商旅'
    ,didi_use_duration          STRING COMMENT '使用时长'
    ,hw_pay_30dy_pay_amt_dev    DOUBLE COMMENT '使用时长'
)
COMMENT '用户信息表'
PARTITIONED BY (pt_d STRING COMMENT '天分区')
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
LINES TERMINATED BY '\n'
STORED AS ORC
LOCATION '/AppData/BIProd/ADS/Persona/ads_persona_datamining_consumption_level_features_dev_ds'
TBLPROPERTIES('orc.compress'='ZLIB')
;

INSERT OVERWRITE TABLE ads_persona_datamining_consumption_level_features_dev_ds
PARTITION(pt_d='$date')
SELECT
    t1.imei                 AS imei
    ,t1.shop_app_usage_duration  AS shop_app_usage_duration
    ,t2.pay_app_usage_duration   AS pay_app_usage_duration
    ,t3.finance_app_usage_duration AS finance_app_usage_duration
    ,t4.bank_app_usage_duration  AS bank_app_usage_duration
    ,t5.travel_app_usage_duration  AS travel_app_usage_duration
    ,t6.carUsage_app_usage_duration  AS carUsage_app_usage_duration
    ,t7.house_app_usage_duration  AS house_app_usage_duration
    ,t8.takeout_app_usage_duration  AS takeout_app_usage_duration
    ,t9.carInfo_app_usage_duration  AS carInfo_app_usage_duration
    ,t10.stock_app_usage_duration  AS stock_app_usage_duration
    ,t11.carRaising_app_usage_duration  AS carRaising_app_usage_duration
    ,t12.price_dev          AS price_dev
    ,t13.city               AS city
    ,t14.tvlr_hobby_dev         AS tvlr_hobby_dev
    ,t14.bsn_tvlr_dev       AS bsn_tvlr_dev
    ,t15.didi_use_duration  AS didi_use_duration
    ,t16.hw_pay_30dy_pay_amt_dev  AS hw_pay_30dy_pay_amt_dev
FROM
    (
        SELECT
            imei
            ,duration_30d as shop_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='商城'
    )t1
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as pay_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='支付'
    )t2
    ON (t1.imei=t2.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as finance_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='理财'
    )t3
    ON (t1.imei=t3.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as bank_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='银行'
    )t4
    ON (t1.imei=t4.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as travel_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='旅游'
    )t5
    ON (t1.imei=t5.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as carUsage_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='用车'
    )t6
    ON (t1.imei=t6.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as house_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='租房买房'
    )t7
    ON (t1.imei=t7.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as takeout_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='外卖'
    )t8
    ON (t1.imei=t8.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as carInfo_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='汽车资讯'
    )t9
    ON (t1.imei=t9.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as stock_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='股票基金'
    )t10
    ON (t1.imei=t10.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,duration_30d as carRaising_app_usage_duration
        FROM ads_persona_label_1level_app_category_usage_30d_dev_ds
        WHERE category='养车'
    )t11
    ON (t1.imei=t11.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,price_dev
        FROM ads_persona_label_0level_v3_price_dev_ds
        WHERE pt_d='$date'
    )t12
    ON (t1.imei=t12.imei)
    LEFT JOIN 
    (
        SELECT
            id
            ,city
        FROM ads_persona_label_0level_v3_residence_new_ds
        WHERE pt_d='$date' AND pt_id_type='dev'
    )t13
    ON (t1.imei=t13.id)
    LEFT JOIN
    (
        SELECT
            imei
            ,tvlr_hobby_dev
            ,bsn_tvlr_dev
        FROM ads_persona_label_0level_v3_app_pref_tvlr_hobby_dev_ds
        WHERE pt_d=concat('$month','01')
    )t14
    ON (t1.imei=t14.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,use_duration AS didi_use_duration
        FROM ads_persona_label_1level_app_usage_30d_dev_dm
        WHERE pt_d='$date' AND package_name='com.sdu.didi.psnger'
    )t15
    ON (t1.imei=t15.imei)
    LEFT JOIN
    (
        SELECT
            imei
            ,hw_pay_30dy_pay_amt_dev
        FROM ads_persona_label_0level_v3_hw_pay_30dy_fee_dev_ds
        WHERE pt_d='$date'
    )t16
    ON (t1.imei=t16.imei)
;
# @DESC 保留近30天数据
ALTER TABLE ads_persona_datamining_consumption_level_features_dev_ds DROP IF EXISTS PARTITION (pt_d ='${start_time,-30,yyyyMMdd}');
"