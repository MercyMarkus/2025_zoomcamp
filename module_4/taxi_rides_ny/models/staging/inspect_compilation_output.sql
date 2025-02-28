select * 
from {{ source('staging', 'green' ) }}