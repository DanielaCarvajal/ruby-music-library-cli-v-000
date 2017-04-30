class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize (name)
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
    genre = self.new(name)
    @@all << genre
    genre
  end

  def artists
   @songs.collect {|s| s.artist}.uniq
  end

end
