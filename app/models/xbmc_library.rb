class Genre
  include DataMapper::Resource
  
  storage_names[:default] = 'genre'
  
  property :idGenre, Serial
  property :strGenre, String
  
  has n, :genre_link_movies, :child_key => [:idGenre], :class_name => 'GenreLinkMovie'
  has n, :movies, :through => :genre_link_movies, :class_name => 'GenreLinkMovie', :child_key => [:idMovie]
  
  def name
    attribute_get(:strGenre)
  end
  
end

class GenreLinkMovie
  include DataMapper::Resource
  
  storage_names[:default] = 'genrelinkmovie'
    
  property :idGenre, Integer, :key => true
  property :idMovie, Integer, :key => true
  
  belongs_to :movie, :child_key => [:idMovie]
  belongs_to :genre, :child_key => [:idGenre]
  
end

class Movie
  include DataMapper::Resource
  
  storage_names[:default] = 'movie'
  
  property :idMovie, Serial
  property :idFile, Integer, :key => true
  property :c00, String
  property :c01, String
  property :c02, String
  property :c03, String
  property :c04, String
  property :c05, String
  property :c06, String
  property :c07, String
  property :c08, String
  property :c09, String
  property :c10, String
  property :c11, String
  property :c12, String
  property :c13, String
  property :c14, String
  property :c15, String
  property :c16, String
  property :c17, String
  property :c18, String
  property :c19, String
  property :c20, String

  has n, :genre_link_movies, :child_key => [:idMovie], :class_name => 'GenreLinkMovie'
  has n, :genres, :through => :genre_link_movies, :class_name => 'GenreLinkMovie', :child_key => [:idGenre]
  belongs_to :file, :class_name => "MediaFile", :child_key => [:idFile]

  def title
    attribute_get(:c00)
  end

  def description
    attribute_get(:c01)
  end
  
  def tagline
    attribute_get(:c02)
  end
  
  def imdb_score
    attribute_get(:c05)
  end

  def director
    attribute_get(:c06)
  end

  def year
    attribute_get(:c07)
  end
  
  def thumbs
    Hash.from_xml(attribute_get(:c08))['thumbs']['thumb']
  end

  def imdb_id
    attribute_get(:c09)
  end

  def length
    attribute_get(:c11)
  end

  def rating
    attribute_get(:c12)
  end

  def genres
    attribute_get(:c14)
  end

  def path
    self.file.path.path
  end
  
  def filename
    self.file.filename
  end

  def full_path
    self.path + self.filename
  end

end

class MediaFile
  include DataMapper::Resource
  
  storage_names[:default] = 'files'
  
  property :idFile, Serial
  property :idPath, Integer, :key => true
  property :strFilename, String
  
  belongs_to :path, :class_name => "Path", :child_key => [:idPath]
  
  def filename
    attribute_get(:strFilename)
  end
  
end

class Path
  include DataMapper::Resource
  
  storage_names[:default] = 'path'
  
  property :idPath, Serial
  property :strPath, String
  property :strContent, String
  property :strScraper, String
  property :strHash, String
  property :scanRecursive, Integer
  property :useFolderNames, Boolean
  property :strSettings, String
  
  def path
    attribute_get(:strPath)
  end

end

class TvShow
  include DataMapper::Resource
  
  storage_names[:default] = 'tvshow'
  
  property :idShow, Serial
  property :c00, String
  property :c01, String
  property :c02, String
  property :c03, String
  property :c04, String
  property :c05, String
  property :c06, String
  property :c07, String
  property :c08, String
  property :c09, String
  property :c10, String
  property :c11, String
  property :c12, String
  property :c13, String
  property :c14, String
  property :c15, String
  property :c16, String
  property :c17, String
  property :c18, String
  property :c19, String
  property :c20, String
  
  has n, :tvshow_link_episodes, :child_key => [:idShow]
  has n, :episodes, :through => :tvshow_link_episodes

  def title
    attribute_get(:c00)
  end

  def description
    attribute_get(:c01)
  end

  def thumbs
    Hash.from_xml(attribute_get(:c06))['thumbs']['thumb']
  end

end

class TvshowLinkEpisode
  include DataMapper::Resource

  storage_names[:default] = 'tvshowlinkepisode'
  
  property :idShow, Serial
  property :idEpisode, Serial
  
  belongs_to :tv_show, :child_key => [:idShow]
  belongs_to :episode, :child_key => [:idEpisode]
  
end

class Episode
  include DataMapper::Resource

  storage_names[:default] = 'episode'

  property :idEpisode, Serial
  property :idFile, Integer, :key => true
  property :c00, String
  property :c01, String
  property :c02, String
  property :c03, String
  property :c04, String
  property :c05, String
  property :c06, String
  property :c07, String
  property :c08, String
  property :c09, String
  property :c10, String
  property :c11, String
  property :c12, String
  property :c13, String
  property :c14, String
  property :c15, String
  property :c16, String
  property :c17, String
  property :c18, String
  property :c19, String
  property :c20, String
  
  belongs_to :file, :class_name => "MediaFile", :child_key => [:idFile]

  def title
    attribute_get(:c00)
  end

  def description
    attribute_get(:c01)
  end

  def date_aired
    attribute_get(:c05)
  end

  def thumb
    Hash.from_xml(attribute_get(:c06))['thumb']
  end

  def season_number
    attribute_get(:c12)
  end

  def episode_number
    attribute_get(:c13)
  end

  def path
    self.file.path.path
  end
  
  def filename
    self.file.filename
  end

  def full_path
    self.path + self.filename
  end
  
end
