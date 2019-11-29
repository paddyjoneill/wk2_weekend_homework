require('minitest/autorun')
require('minitest/reporters')
require_relative('../karaoke_bar')
require_relative('../rooms')
require_relative('../customers')
require_relative('../songs')
require_relative('../drink')
require_relative('../bar')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestKaraoke < MiniTest::Test

  def setup
    @song1 = Song.new("Your Song", "Elton John")
    @song2 = Song.new("Song 2", "Blur")
    @song3 = Song.new("Country Roads", "John Denver")
    @customer1 = Customer.new("Tony", 30, 100, @song1)
    @customer2 = Customer.new("Barbara", 32, 150, @song2)
    @customer3 = Customer.new("John Denver", 60, 1500, @song3)
    @customer4 = Customer.new("Reginald Dwight", 23, 4, @song3)
    @room1 = Room.new("Room1", 8, [@song1, @song2, @song3],[@customer1, @customer2])
    @room2 = Room.new("Room2", 6, [@song1, @song2], [@customer1])
    @room3 = Room.new("Room3", 4, [@song3, @song2], [@customer3])
    @supercube = KaraokeBar.new("Super Cube", [@room1, @room2], 1000, 5)
  end

  def test_supercube_has_name
    assert_equal("Super Cube", @supercube.name)
  end

  def test_how_many_rooms
    assert_equal(2, @supercube.rooms.count)
  end

  def test_can_add_room
    @supercube.add_room(@room3)
    assert_equal(3, @supercube.rooms.count)
  end

  def test_can_add_customer_to_room
    @supercube.add_customer(@room1, @customer3)
    assert_equal(3, @room1.customers.count)
  end

  def test_cant_add_too_many_people
    @supercube.add_customer(@room3, @customer3)
    @supercube.add_customer(@room3, @customer3)
    @supercube.add_customer(@room3, @customer3)
    @supercube.add_customer(@room3, @customer3)
    assert_equal(4, @room3.customers.count)
  end

  def test_can_remove_customers_from_room
    @supercube.remove_customer(@room1, @customer1)
    assert_equal(1, @room1.customers.count)
  end

  def test_add_song_to_room
    @supercube.add_song(@room2, @song3)
    assert_equal(3, @room2.songs.count)
  end

  def test_customer_has_enough_money_for_purchase
    assert_equal(true, @customer1.has_enough_money(@supercube.entrance_fee))
  end

  def test_customer_doesnt_have_enough_money_for_purchase
    assert_equal(false, @customer4.has_enough_money(@supercube.entrance_fee))
  end

  def test_increase_till_by_entrance_fee
    @supercube.increase_till(@supercube.entrance_fee)
    assert_equal(1005, @supercube.till)
  end

  def test_customer_pays_entrance_fee
    @supercube.pay_entrance_fee(@customer1)
    assert_equal(1005, @supercube.till)
    assert_equal(95, @customer1.money)
  end

  def test_customer_not_enough_money_for_entrance
    @supercube.pay_entrance_fee(@customer4)
    assert_equal(1000, @supercube.till)
    assert_equal(4, @customer4.money)
  end

  def test_add_customer_to_room_and_pays
    @supercube.add_customer(@room1, @customer3)
    assert_equal(3, @room1.customers.count)
    assert_equal(1005, @supercube.till)
    assert_equal(1495, @customer3.money)
    assert_equal(5, @room1.total_spend)
  end

  def test_try_to_add_customer_to_room_but_not_enough_money
    @supercube.add_customer(@room1, @customer4)
    assert_equal(2, @room1.customers.count)
    assert_equal(1000, @supercube.till)
    assert_equal(4, @customer4.money)
    assert_equal(0, @room1.total_spend)
  end

end
