select * 
from {{ source('staging', 'green_trips' ) }}