class Media < Application

  def index
    render
  end
  
  def search(q)
    %w(the and of).each do |word|
      q =  q.gsub(/^(#{word}\s?)$/, '')
    end
    unless q.empty?
      repository.adapter.query(
      <<-SQL
        SELECT c00,c07,c11,c12,c14,c18
        FROM movie WHERE c00 LIKE '% #{q}%' OR c00 LIKE '#{q}%'
      SQL
      ).inject('') do |s,m|
        s << "#{m.c00}|#{m.c07}|#{m.c11}|#{get_rating_image(m.c12)}|#{m.c14}\n"
        s
      end
    end
  end
  
  private
  
  def get_rating_image(str)
    str =~ /^Rated\s(G|PG|PG-13|R|NC-17)\s.*$/
    if rating = $1
      "/images/rating_#{rating.gsub('-', '').downcase}.gif"
    end
  end
  
end
