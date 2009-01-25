class Media < Application

  def index
    @number_of_movies = Movie.count
    render
  end
  
  def search(q)
    %w(the and of).each do |word|
      q =  q.gsub(/^(#{word}\s?)$/, '')
    end
    unless q.empty?
      repository.adapter.query(
      <<-SQL
        SELECT c00,c07,c11,c12,c14
        FROM movie WHERE c00 LIKE '% #{q}%' OR c00 LIKE '#{q}%'
      SQL
      ).inject(String.new) do |str, movie|
        # handle wacky movie lengths with '|' char
        movie.c11 =~ /^(\d*\smin)/
        str << "#{movie.c00}|#{movie.c07}|#{$1}|#{get_rating_image(movie.c12)}|#{movie.c14.gsub(' ','')}\n"
        str
      end
    end
  end
  
  private
  
  def get_rating_image(str)
    str =~ /^Rated\s(G|PG-13|PG|R|NC-17|NR)/
    if rating = $1
      "/images/rating_#{rating.gsub('-', '').downcase}.gif"
    end
  end
  
end
