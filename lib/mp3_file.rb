class MP3File
  attr_reader :artist, :song, :genre

  def initialize(file_name)
    @artist = file_name.split(" - ")[0]
    @song = file_name.split(" - ")[1]
    @genre = file_name.split(" - ")[2].chomp(".mp3")
  end
end
