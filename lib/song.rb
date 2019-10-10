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
    song.name = nil
    song.artist_name = nil
    song.save
    song
  end

  def self.new_by_name(name)
    song= self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_or_create_by_name(name)
    # another way of finding it
    # if @@all.include?(name) then
    #   self.song
    # else
    #   self.create_by_name(name)
    # end
    # self.song

    self.all.find {|song| song.name == name}

  end

  def self.find_by_name(name)
    # I used .find because .select was returning an array and I needed just the object
    self.all.find {|song| song.name == name}
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
  # this will split string into an array with 2 values
  # filename= Thundercat - For Love I Come.mp3
  # array[0]= Thundercat
  # array[1]= For Love I Come -- after the .mp3 is chomped/removed
    file_name_part = filename.split(" - ")
    file_name_part[1]= file_name_part[1].chomp(".mp3")
    song_title= file_name_part[1]
    song_artist = file_name_part[0] 
    
    song= self.create_by_name(song_title)
    song.artist_name = song_artist
    song
    
  end

  def self.find_or_create_by_name(name)
    #  if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    # self.create_by_name(name)
    # end
    self.find_by_name(name)? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.destroy_all
    self.all.clear
  end
  
  def self.create_from_filename(filename)
    file_name_part = filename.split(" - ")
    file_name_part[1]= file_name_part[1].chomp(".mp3")
    song_title= file_name_part[1]
    song_artist = file_name_part[0]

    song= self.create_by_name(song_title)
    song.artist_name = song_artist
    song
  end

end

# song_1 = Song.create_by_name("Thriller")
# song_2 = Song.create_by_name("Blank Space")
# song_3 = Song.create_by_name("Call Me Maybe")

song_1 = Song.create_by_name("Blank Space")
song_2 = Song.create_by_name("Hello")
song_3 = Song.create_by_name("Hotline Bling")


# song= Song.create
# checkbool= Song.all.include?(song)

#
# song2.name
# binding.pry