-- Capstone Answers
-- Fill in each query below.

-- Q1: List every artist name and country, sorted alphabetically by name.
select name, country from artists order by name;

-- Q2: How many albums are in the catalog?
select count(*) from albums;

-- Q3: Which genre has the most albums? (genre name and count)
select name, count(*) as album_count from genres

-- Q4: Album titles released before 1970, with artist name.
select albums.title, artists.name from albums join artists on albums.artist_id = artists.id where albums.year_released < 1970;

-- Q5: Longest track — title, album title, duration as MM:SS.
select tracks.title, albums.title as album_title, printf('%02d:%02d', tracks.duration_sec / 60, tracks.duration_sec % 60) as duration from tracks join albums on tracks.album_id = albums.id order by tracks.duration_sec desc limit 1;

-- Q6: Track count per album, sorted by count descending.
select albums.title, count(tracks.id) as track_count from albums join tracks on albums.id = tracks.album_id group by albums.id order by track_count desc;

-- Q7: Artists with more than one album.


-- Q8: Tracks longer than 5 minutes — track title, album title, artist name.


-- Q9: Average track duration per genre (in seconds, rounded to 1 decimal).


-- Q10: Artist with the most total tracks — artist name and total count.


-- BONUS: Per-album summary (title, artist, genre, track count, total minutes).
