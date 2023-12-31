require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    if self.title == title
      return self
    else
      raise "#{self} not in database"
    end
  end

  # returns all plays written by playwright
  def find_by_playwright(name)


  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end


  class Playwright

    def self.all
      pw_data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
      pw_data.map {|da| Playwright.new(da)}
    end

    def self.find_by_name(name)
      if self.name = name
        return self
      else
        raise "#{self} not in database"
      end
    end

    def new(options)
      @id = options['id']
      @name = options['name']
      @birth_year = options['birth_year']
    end

    def create
      raise "#{self} already in database" if self.id
      PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
        INSERT INTO
          playwrights (name, birth_year)
        VALUES
          (?, ?)
      SQL
      self.id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
      raise "#{self} already in database" if self.id.nil?
      PlayDBConnection.instance.execute(<<-SQL self.name, self.birth_year, self.id)
        UPDATE
          playwrights
        SET
          name = ?, birth_year = ?
        WHERE
          id = ?
      SQL
    end

    def get_plays

    end

  end
