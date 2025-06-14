
with raw_genome_scores as (
    select * from {{ source('raw', 'raw_genome_scores') }}
)

select 
    movieId as movie_id,
    tagId as tag_id,
    relevance
from raw_genome_scores