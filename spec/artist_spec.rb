require 'rspec'
require 'artist'
require('spec_helper')

describe '#Artist' do

  describe('#save') do
    it("Saves artist") do
      artist = Artist.new({:id => nil, :name => "Kind of Blue"})
      artist.save()
      artist2 = Artist.new({:id => nil, :name => "Kind of Green"})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new({:id => 1, :name => "Kind of Blue"})
      artist2 = Artist.new({:id => 2, :name => "Kind of Blue"})
      expect(artist).to(eq(artist2))
    end
  end
  #
  describe('.clear') do
    it('clears all artists') do
      artist = Artist.new({:name => "Giant Steps", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blue", :id => nil})
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end
  #
  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new({:name => "Giant Steps", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blue", :id => nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end


  describe('#delete') do
    it('deletes an artist by id') do
      artist = Artist.new({:name => "Giant Steps", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blue", :id => nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('#update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      artist.update({:album_name => "A Love Supreme"})
      expect(artist.albums).to(eq([album]))
    end
  end

  describe('#update') do
    it("Able to change an artists name") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist.update({:name => "Joan Rivers", :album_name => "Something Silly"})
      expect(artist.name).to(eq("Joan Rivers"))
    end
  end

end
