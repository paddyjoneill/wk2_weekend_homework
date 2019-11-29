require('minitest/autorun')
require('minitest/reporters')
require_relative('../customers')
require_relative('../songs')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCustomer < MiniTest::Test

  def setup
    @song1 = Song.new("Wonderwall", "Oasis")
    @customer = Customer.new("Tony", 30, 100, @song1)
  end

  def test_customer_has_name
    assert_equal("Tony", @customer.name)
  end

  def test_customer_has_age
    assert_equal(30, @customer.age)
  end

  def test_customer_has_money
    assert_equal(100, @customer.money)
  end

  def test_customer_has_fav_song
    assert_equal(@song1, @customer.fav_song)
  end

  def test_can_take_customers_money
    @customer.remove_money(20)
    assert_equal(80, @customer.money)
  end

end
