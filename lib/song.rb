require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song 
    song
  end

  def self.new_by_name (song_name)
    new_song = Song.new 
    new_song.name = song_name
    new_song
  end

  def self.create_by_name (song_name)
    new_song = Song.new 
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name (name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    if self.find_by_name (name)
      self.find_by_name (name)
    else self.create_by_name (name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    filename_array = filename.split(" - ")
    song.artist_name = filename_array[0] 
    song_name = filename_array[1].split(".")[0]
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end

end
