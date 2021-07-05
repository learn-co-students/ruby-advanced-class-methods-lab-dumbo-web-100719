require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  
  def self.new_by_name(title)
    named_song = self.new
    named_song.name = title
    named_song
    
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.create_by_name (name)
    song = self.new_by_name(name)
    song.save
    song
  
  end

  def self.find_by_name (name)
    @@all.find {|song| song.name == name}
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name (name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(path)
    ids = path.split("-")
    ids_no_mp3 = ids[1].split(".")
    song = self.new
    song.artist_name = ids[0].strip!
    song.name = ids_no_mp3[0].strip!
    song
    
    
  end
  def self.create_from_filename(path)
    song = self.new_from_filename(path)
    song.save
    song
    
    
  end

  def self.destroy_all

    @@all = []
  end
end
