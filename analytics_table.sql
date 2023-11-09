'''create analytics table from dims and fact table'''

CREATE OR REPLACE TABLE capable-vista-403702.uber_data_engr_hmalik.analytics_table AS (
select f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pk.pickup_latitude,
pk.pickup_longitude,
dr.dropoff_latitude,
dr.dropoff_longitude,
py.payment_type_name,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
from

capable-vista-403702.uber_data_engr_hmalik.fact_table f   
JOIN capable-vista-403702.uber_data_engr_hmalik.datetime_dim d ON f.datetime_id = d.datetime_id
JOIN capable-vista-403702.uber_data_engr_hmalik.passenger_count_dim p ON p.passenger_count_id=f.passenger_count_id
JOIN capable-vista-403702.uber_data_engr_hmalik.trip_distance_dim t ON t.trip_distance_id=f.trip_distance_id
JOIN capable-vista-403702.uber_data_engr_hmalik.rate_code_dim r ON r.rate_code_id=f.rate_code_id
JOIN capable-vista-403702.uber_data_engr_hmalik.pickup_location_dim pk ON pk.pickup_location_id=f.pickup_location_id
JOIN capable-vista-403702.uber_data_engr_hmalik.dropoff_location_dim dr ON dr.dropoff_location_id=f.dropoff_location_id
JOIN capable-vista-403702.uber_data_engr_hmalik.payment_type_dim py ON py.payment_type_id=f.payment_type_id ) ;