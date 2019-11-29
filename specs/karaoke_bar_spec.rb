require('minitest/autorun')
require('minitest/reporters')
require_relative('../karaoke_bar')
require_relative('../rooms')
require_relative('../customers')
require_relative('../songs')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestKaraoke < MiniTest::Test

  def setup
    @song1 = Song.new("Your Song", "Elton John")
    @song2 = Song.new("Song 2", "Blur")
    @song3 = Song.new("Country Roads", "John Denver")
    @customer1 = Customer.new("Tony", 30, 100, @song1)
    @customer2 = Customer.new("Barbara", 32, 150, @song2)
    @customer3 = Customer.new("John Denver", 60, 1500, @song3)
    @room1 = Room.new("Room1", 8, [@song1, @song2, @song3],[@customer1, @customer2])
    @room2 = Room.new("Room2", 6, [@song1, @song2], [@customer1])
    @supercube = KaraokeBar.new("Super Cube", [@room1, @room2], 1000)
  end

  def test_supercube_has_name
    assert_equal("Super Cube", @supercube.name)
  end

end
