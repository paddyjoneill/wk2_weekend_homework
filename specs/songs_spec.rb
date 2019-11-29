require('minitest/autorun')
require('minitest/reporters')
require_relative('../songs.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSongs < MiniTest::Test

def setup
  @song1 = Song.new("Your Song", "Elton John")
end

def test_song_has_title
  assert_equal("Your Song", @song1.title)
end

def test_song_has_an_artist
  assert_equal("Elton John", @song1.artist)
end

end
