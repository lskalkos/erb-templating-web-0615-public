class Movie
  attr_accessor :title, :release_date, :director, :summary

  @@all = []

  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@all << self
  end

  def url
    "#{self.title.gsub(" ", "_").downcase}.html"
  end

  def self.all
    @@all
  end

  def self.reset_movies!
    @@all = []
  end

  def self.make_movies!
    File.open('./spec/fixtures/movies.txt').each_with_index do |line, index|
      components = line.split(" - ")
      title = components[0]
      release_date = components[1].to_i
      director = components[2]
      summary = components[3]

      Movie.new(title, release_date, director, summary)

    end

  end

  def self.recent
    self.all.select{|movie| movie.release_date >= 2012}
  end

end