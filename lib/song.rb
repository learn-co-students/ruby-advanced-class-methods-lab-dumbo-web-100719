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
  song.save
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
  song.save
  song
end

def self.find_by_name(name)
  @@all.find do |the_song_instance|
    if the_song_instance.name == name
      the_song_instance
    end
  end

end
  
def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
    #returns the song object already created
  else self.create_by_name(name)
  end
end

def self.alphabetical
  @@all.sort_by do |the_song_instance|
  the_song_instance.name
  end
end

def self.new_from_filename(filename)
  song = self.new
  song.name=filename.split(/\- |\./)[1]
  song.artist_name= filename.split(/\ -|\./)[0]
  song
end

def self.create_from_filename(filename)
  song = self.new
  song.name=filename.split(/\- |\./)[1]
  song.artist_name= filename.split(/\ -|\./)[0]
  song.save
  song
end

def self.destroy_all
  @@all= []
end

end
