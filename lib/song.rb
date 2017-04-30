class Song
  attr_accessor :name, :song, :artist, :genre
  extend Concerns::Findable
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def save
    @@all << self
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? (self)
  end

  def self.create_from_filename(file_name)
    parts = file_name.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def self.new_from_filename(file_name)
    array = file_name.split(" - ")
    artist_name = array[0]
    artist = Artist.find_or_create_by_name(artist_name)
    title = array[1]
    genre_name = (array[2].chomp(".mp3"))
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(title, artist, genre)
  end

  #def self.count
  #  self.all.count
  #end

end
