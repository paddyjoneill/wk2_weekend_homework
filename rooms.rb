class Room

  attr_reader :name, :capacity, :songs, :customers

  def initialize(name, capacity, songs, customers = [] )
    @name = name
    @capacity = capacity
    @songs = songs
    @customers = customers
    @total_spend = 0
  end

  def add_customer(customer)
    return if @customers.count >= @capacity
    @customers << customer
  end

  def remove_customer(customer)
    @customers.delete(customer)
  end

  def add_song(song)
    @songs << song
  end

  def remove_song(song)
    @songs.delete(song)
  end

  def customer_fav_song
    for customer in @customers
      for song in @songs
        if song == customer.fav_song
          return "Whoo!"
        end
      end
    end
    return nil
  end

end
