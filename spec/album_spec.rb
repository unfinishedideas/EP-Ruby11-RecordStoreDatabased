require 'rspec'
require 'album'
require('spec_helper')

describe '#Album' do

  describe('#save') do
    it("Saves album") do
      album = Album.new({:id => nil, :name => "Kind of Blue"})
      album.save()
      album2 = Album.new({:id => nil, :name => "Kind of Green"})
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new({:id => 1, :name => "Kind of Blue"})
      album2 = Album.new({:id => 2, :name => "Kind of Blue"})
      expect(album).to(eq(album2))
    end
  end
  #
  describe('.clear') do
    it('clears all albums') do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil})
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end
  #
  describe('.find') do
    it("finds an album by id") do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil})
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album.update("Blue")
      expect(album.name).to(eq("Blue"))
    end
  end

  describe('#delete') do
    it('deletes an album by id') do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil})
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end
  #
  # describe('.search') do
  #   it('searches for the given album name') do
  #     Album.clear()
  #     album = Album.new("Giant Steps", nil, 2000, "bluegrass", "old mcdonald", nil)
  #     album.save()
  #     album3 = Album.new("Giant Steps", nil, 2010, "bluegrass", "old mcdonald", nil)
  #     album3.save()
  #     album2 = Album.new("Blue", nil, 1990, "pop", "Aba", nil)
  #     album2.save()
  #     expect(Album.search("giant steps")).to(eq([album, album3]))
  #   end
  # end
  #
end
