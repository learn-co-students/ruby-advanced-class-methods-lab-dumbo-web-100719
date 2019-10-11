require "pry"
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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(string_name) 
    new_song = self.new
    new_song.name = string_name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    song_arr = self.all.select do |song_instance|
      song_instance.name == name
    end   
    song_arr[0]
  end

  def self.find_or_create_by_name(song_name)
    # binding.pry
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song_instance|
      song_instance.name
    end
  end

  def self.new_from_filename(file_name)
    (artist, song_name, file) = file_name.split(/\. | \-/)
    binding.pry

  end

end
