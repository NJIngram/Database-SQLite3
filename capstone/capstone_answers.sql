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
select artists.name, count(albums.id) as album_count from artists join albums on artists.id = albums.artist_id group by artists.id having album_count > 1;

-- Q8: Tracks longer than 5 minutes — track title, album title, artist name.
select tracks.title, albums.title as album_title, artists.name from tracks join albums on tracks.album_id = albums.id join artists on albums.artist_id = artists.id where tracks.duration_sec > 300;

-- Q9: Average track duration per genre (in seconds, rounded to 1 decimal).
select genres.name, round(avg(tracks.duration_sec), 1) as avg_duration from genres join albums on genres.id = albums.genre_id join tracks on albums.id = tracks.album_id group by genres.id;

-- Q10: Artist with the most total tracks — artist name and total count.
select artists.name, count(tracks.id) as total_tracks from artists join albums on artists.id = albums.artist_id join tracks on albums.id = tracks.album_id group by artists.id order by total_tracks desc limit 1;

-- BONUS: Per-album summary (title, artist, genre, track count, total minutes).
select albums.title, artists.name as artist_name, genres.name as genre_name, count(tracks.id) as track_count, round(sum(tracks.duration_sec) / 60.0, 2) as total_minutes from albums join artists on albums.artist_id = artists.id join genres on albums.genre_id = genres.id join tracks on albums.id = tracks.album_id group by albums.id order by total_minutes desc;