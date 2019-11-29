class KaraokeBar

  attr_reader :name, :rooms, :till

  def initialize(name, rooms, initial_balance)
    @name = name
    @rooms = rooms
    @till = initial_balance
  end

  def add_room(room)
    @rooms << room
  end

  def add_customer(room, customer)
    room.add_customer(customer)
  end

end
