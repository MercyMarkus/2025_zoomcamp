create table `weighty-pixel-448710-u7.module_4_homework.fhv_trips` (
dispatching_base_num STRING,
pickup_datetime STRING,
dropOff_datetime STRING,
PUlocationID INT64,
DOlocationID INT64,
SR_Flag INT64,
Affiliated_base_number STRING);


insert into `weighty-pixel-448710-u7.module_4_homework.fhv_trips`
select
dispatching_base_num STRING,
pickup_datetime STRING,
dropOff_datetime STRING,
CAST(PUlocationID As INT64),
CAST(DOlocationID As INT64),
CAST(SR_Flag As INT64),
Affiliated_base_number STRING
from `weighty-pixel-448710-u7.module_4_homework.fhv`;