require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name, artist_name)
  #   @name = name 
  #   @artist_name = artist_name 
  #   @all << self
  # end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
   
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(name)
    song = Song.new
    filename_arr = name.split(" - ")
    song.artist_name = filename_arr[0]
    song_name = filename_arr[1].split(".")[0]
    song.name = song_name
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    @@all << song
  end


  def self.destroy_all
    @@all.clear
  end


end