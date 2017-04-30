
class Artist
  attr_accessor :name, :songs, :genres
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    #artist = self.new(name)
    #@@all << artist
    #artist
    new(name).tap{|a| a.save}
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end

end
