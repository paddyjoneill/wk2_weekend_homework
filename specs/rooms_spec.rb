require('minitest/autorun')
require('minitest/reporters')
require_relative('../rooms')
require_relative('../customers')
require_relative('../songs')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRooms < MiniTest::Test

def setup
  @song1 = Song.new("Your Song", "Elton John")
  @song2 = Song.new("Song 2", "Blur")
  @song3 = Song.new("Wonderwall", "Oasis")
  @song4 = Song.new("Country Roads", "John Denver")
  @customer1 = Customer.new("Tony", 30, 100, @song1)
  @customer2 = Customer.new("Barbara", 32, 150, @song2)
  @customer3 = Customer.new("John Denver", 60, 1500, @song3)
  @room1 = Room.new("Room1", 5,[@song1, @song2, @song3],[@customer1, @customer2])
end

def test_room_has_name
  assert_equal("Room1",@room1.name)
end

def test_room_has_a_capacity
  assert_equal(5, @room1.capacity)
end

def test_room_has_songs
  assert_equal([@song1, @song2, @song3], @room1.songs)
end

def test_room_has_customers
  assert_equal([@customer1, @customer2], @room1.customers)
end

def test_add_customer_to_room
  @room1.add_customer(@customer3)
  assert_equal([@customer1, @customer2, @customer3], @room1.customers)
end

def test_remove_customer_from_room
  @room1.add_customer(@customer3)
  @room1.remove_customer(@customer1)
  assert_equal([@customer2, @customer3], @room1.customers)
end

def test_cant_put_too_many_people_in_room
  @room1.add_customer(@customer3)
  @room1.add_customer(@customer3)
  @room1.add_customer(@customer3)
  @room1.add_customer(@customer3)
  assert_equal(5, @room1.customers.count)
end

def test_can_add_song
  @room1.add_song(@song4)
  assert_equal([@song1,@song2,@song3,@song4], @room1.songs)
end

def test_can_remove_song
  @room1.remove_song(@song1)
  assert_equal([@song2,@song3], @room1.songs)
end

end
