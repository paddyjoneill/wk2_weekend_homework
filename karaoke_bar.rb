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

end
