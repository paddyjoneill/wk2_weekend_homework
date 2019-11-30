require('minitest/autorun')
require('minitest/reporters')
require_relative('../drink')
require_relative('../bar')
require('pry')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBar < MiniTest::Test

  def setup
    @beer = Drink.new("Beer", 4)
    @redwine = Drink.new("Red Wine", 6)
    @whitewine = Drink.new("White Wine", 6)
    @mainbar = Bar.new("Main Bar")
  end

  def test_bar_has_name
    assert_equal("Main Bar", @mainbar.name)
  end

  def test_add_drink_to_bar
    @mainbar.add_drink(@beer, 1)
    assert_equal(1, @mainbar.stock[@beer])
  end

  def test_remove_drink_from_bar
    @mainbar.add_drink(@beer, 1)
    @mainbar.add_drink(@beer, 1)
    assert_equal(2, @mainbar.stock[@beer])
    @mainbar.remove_drink(@beer)
    assert_equal(1, @mainbar.stock[@beer])
  end

  def test_total_stock
    @mainbar.add_drink(@beer, 20)
    @mainbar.add_drink(@redwine, 20)
    @mainbar.add_drink(@whitewine, 20)
    assert_equal(60, @mainbar.total_stock)
  end

  def test_total_stock_value
    @mainbar.add_drink(@beer, 20)
    @mainbar.add_drink(@redwine, 20)
    @mainbar.add_drink(@whitewine, 20)
    assert_equal(320, @mainbar.total_stock_value)
  end

end
