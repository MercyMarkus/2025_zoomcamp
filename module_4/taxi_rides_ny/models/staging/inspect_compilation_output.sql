select * 
from {{ source('staging', 'green_tripdata' ) }}