class KaraokeBar

  attr_reader :name, :rooms, :till, :entrance_fee

  def initialize(name, rooms, initial_balance, entrance_fee)
    @name = name
    @rooms = rooms
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

end
