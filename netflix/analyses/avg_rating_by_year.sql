with movies as (
    select * from {{ ref('dim_movies') }}
),
ratings as (
    select * from {{ ref('fact_ratings') }}
)


select release_year, count(*) as total_ratings,
round(avg(rating),2) as average_rating
from movies m
join ratings r on r.movie_id = m.movie_id
group by release_year
order by release_year desc;