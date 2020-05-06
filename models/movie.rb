def run_sql(sql, params = [])
    conn = PG.connect(dbname: 'movies_app')
    records = conn.exec_params(sql, params)
    conn.close
    records
end

def store_movie(title, image_url, year)
    run_sql("INSERT INTO movies (title, image_url, year)
    VALUES ($1, $2, $3);",[title, image_url, year])
end

def find_movie_by_image_url(image_url)
    run_sql("SELECT * FROM movies where image_url = $1", [image_url]);
end


def find_movie_by_title(title)
    run_sql("SELECT * FROM movies where title = $1", [title]);
end