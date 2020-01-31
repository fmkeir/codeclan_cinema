require('pg')
require_relative('../db/sql_runner')

class Screening
  attr_accessor :film_id, :screen_id, :film_time
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"].to_i
    @screen_id = options["screen_id"].to_i
    @film_time = options["film_time"].to_i
  end

  def save()
    sql = "INSERT INTO screenings
    (film_id, screen_id, film_time)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@film_id, @screen_id, @film_time]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    sql = "UPDATE screenings SET
    (film_id, screen_id, film_time)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@film_id, @screen_id, @film_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map {|screening| Screening.new(screening)}
  end

  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end
end
