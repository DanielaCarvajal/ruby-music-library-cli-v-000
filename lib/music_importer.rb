require_relative "mp3_file.rb"
require 'pry'
class MusicImporter
  attr_reader :path

  def initialize(path= "./db/mp3s")
    @path = path
    @dir = Dir.new path
  end

  def path
    @path
  end

  def files
    dir.select { |file| file[0].match /\w/ }
  end

  def import
  
    self.files.each do |file|
      mp3_file = MP3File.new(file)
      artist = Artist.new(mp3_file.artist)
      #artist = Artist.find_or_create_by_name(mp3_file.artist)
      #song = Song.create_from_filename(mp3_file.song)
      #binding.pry
      song = Song.new(mp3_file.song)
      genre = Genre.new(mp3_file.genre)

      #artist.add_song(song)

    end
  end

    #self.files.each do |mp3|
    #  new_song = Song.new_from_filename(mp3)
    #end
  #end

  private
  def dir
    @dir
  end
end
