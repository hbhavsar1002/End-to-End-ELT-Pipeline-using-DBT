with genres as (
    select * from {{ ref('genres') }}
)

select 
    genre_id,
    genre_name
from genres