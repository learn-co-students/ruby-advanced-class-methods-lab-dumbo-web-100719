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
    #song_arr[0]
    #self.all.each do |song_instance|
      
  end

end
