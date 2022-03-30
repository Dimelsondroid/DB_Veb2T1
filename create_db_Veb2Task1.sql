create table if not exists genres (
		id serial primary key,
		genre_name varchar(40) not null
);

create table if not exists performers (
		id serial primary key,
		performer_name varchar(40) not null,
		alias varchar(40) not null,
		genre_id integer references genres(id)
);

create table if not exists albums (
		id serial primary key,
		album_name varchar(40) not null,
		release_year integer check(release_year > 1000),
		performer_id integer references performers(id)
);

create table if not exists tracks (
		id serial primary key,
		track_name varchar(40) not null,
		duration integer check(duration > 0),
		album_id integer references albums(id)
);