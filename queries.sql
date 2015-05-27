-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT title, rating
FROM movies
WHERE rating IS NOT NULL
ORDER BY rating ASC
LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

SELECT title
FROM movies
WHERE rating IS NULL
ORDER BY title;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

SELECT title
FROM movies
WHERE synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

SELECT title, year, rating
FROM movies
WHERE genre_id = 17
AND rating IS NOT NULL
ORDER BY rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).
SELECT actors.name AS actor_name, movies.title AS movie_title, movies.year
FROM actors
RIGHT JOIN cast_members
ON actors.id = cast_members.actor_id
JOIN movies
ON cast_members.movie_id = movies.id
WHERE cast_members.character LIKE '%James Bond%'  ORDER BY movies.year;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

SELECT movies.title AS movie_title, movies.year AS year_released, genres.name AS genre
FROM movies
LEFT JOIN genres
ON genres.id = movies.genre_id
RIGHT JOIN cast_members
ON movies.id = cast_members.movie_id
RIGHT JOIN actors
ON cast_members.actor_id = actors.id
WHERE actors.name = 'Julianne Moore'
ORDER BY genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT movies.title AS movie_title, movies.year AS year_released, studios.name AS studio_name_if_any
FROM movies
LEFT JOIN genres
ON genres.id = movies.genre_id
LEFT OUTER JOIN studios
ON movies.studio_id = studios.id
WHERE genres.name = 'Horror'
ORDER BY movies.year
LIMIT 5;
