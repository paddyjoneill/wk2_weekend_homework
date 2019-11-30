require 'pry'

class KaraokeBar

  attr_reader :name, :rooms, :bars, :till, :entrance_fee

  def initialize(name, rooms, bars, initial_balance, entrance_fee)
    @name = name
    @rooms = rooms
    @bars = bars
    @till = initial_balance
    @entrance_fee = entrance_fee
  end

  def add_room(room)
    @rooms << room
  end

  def add_customer(room, customer)
    if customer.money >= @entrance_fee
      customer.remove_money(@entrance_fee)
      @till += @entrance_fee
      room.add_customer(customer)
      room.increase_total_spend(@entrance_fee)
      room.increase_customer_tab(customer, @entrance_fee)
    end
  end

  def remove_customer(room, customer)
    room.remove_customer(customer)
  end

  def add_song(room, song)
    room.add_song(song)
  end

  def increase_till(amount)
    @till += amount
  end

  def pay_entrance_fee(customer)
    if customer.money >= @entrance_fee
      customer.remove_money(@entrance_fee)
      @till += @entrance_fee
    end
  end

  def add_bar(bar)
    @bars << bar
  end

  def add_drinks(bar, drink, amount)
    bar.add_drink(drink, amount)
  end

  def stock_check(bar, drink)
    bar.stock[drink]
  end

  def remove_drink(bar, drink)
    bar.remove_drink(drink)
  end

  def sell_drink_to_customer(room, customer, bar, drink)
    return if !customer.has_enough_money(drink.price)
    return if bar.stock[drink] < 1
    customer.remove_money(drink.price)
    bar.remove_drink(drink)
    @till += drink.price
    room.increase_total_spend(drink.price)
    room.increase_customer_tab(customer, drink.price)
  end

  def total_stock
    total_stock = 0
    for bar in @bars
      # binding.pry
      for drink in bar.stock.keys
        total_stock += bar.stock[drink]
      end
    end
    return total_stock
  end

  def total_stock_value
    total_stock_value = 0
    for bar in @bars
      for drink in bar.stock.keys
        total_stock_value += (bar.stock[drink] * drink.price)
      end
    end
    return total_stock_value
  end

end
