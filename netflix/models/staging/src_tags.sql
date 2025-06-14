with raw_tags as (
    select * from {{ source('raw', 'raw_tags') }}
)

select 
    useId as user_id,
    movieId as movie_id,
    tag,
    to_timestamp_ltz(timestamp) as rating_timestam
from raw_tags