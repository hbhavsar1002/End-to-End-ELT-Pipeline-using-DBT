-- analyses/top_users_by_rating.sql

select 
    user_id,
    count(*) as num_ratings,
    round(avg(rating), 2) as avg_rating
from {{ ref('fact_ratings') }}
group by user_id
order by num_ratings desc
limit 10;
