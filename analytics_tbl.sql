create or replace table `uber_data_engineering.analytics_table` as (
select 

f.trip_id,
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
r.rate_code_name,
pk.pickup_latitude,
pk.pickup_longitude,
dp.dropoff_latitude,
dp.dropoff_longitude,
py.payment_type_name,
f.passenger_count,
f.trip_distance,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount


from `uber_data_engineering.fact_table` f
join `uber_data_engineering.datetime_dim` d on f.datetime_id = d.datetime_id
join `uber_data_engineering.dropoff_location_dim` dp on f.dropoff_location_id = dp.dropoff_location_id
join `uber_data_engineering.payment_type_dim` py on f.payment_type_id = py.payment_type_id
join `uber_data_engineering.pickup_location_dim` pk on f.pickup_location_id = pk.pickup_location_id
join `uber_data_engineering.rate_code_dim` r on f.rate_code_id = r.rate_code_id);