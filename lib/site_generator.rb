class SiteGenerator

  def make_index!
    html = File.read('./spec/fixtures/index.html')
    File.write('./_site/index.html', html)
  end

  def generate_pages!
    require 'fileutils'
    FileUtils::mkdir_p '_site/movies'

    html = File.read('./lib/templates/movie.html.erb')
    template = ERB.new(html)

    @movies = Movie.all

    @movies.each do |movie|
      @movie = movie
      File.write("./_site/movies/#{movie.url}", template.result(binding))
    end

  end

end