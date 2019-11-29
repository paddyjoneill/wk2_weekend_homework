require('minitest/autorun')
require('minitest/reporters')
require_relative('../drink')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestDrinks < MiniTest::Test

  def setup
    @drink1 = Drink.new("beer", 4 )
  end

  def test_drink_has_name
    assert_equal("beer", @drink1.name)
  end

  def test_drink_has_price
    assert_equal(4, @drink1.price)
  end

end
