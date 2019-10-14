class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end 

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song 
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      if song.name == song_name
        song
      else 
        nil
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    print Song
    split_filename = filename.split(" - ")
    song = Song.new
    song.artist_name = split_filename[0]
    song.name = split_filename[1].split(".mp3")[0]
    song

  end

  def self.create_from_filename(filename)
    split_filename = filename.split(" - ")
    song = Song.new
    song.artist_name = split_filename[0]
    song.name = split_filename[1].split(".mp3")[0]
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end

end
