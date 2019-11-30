class Room

  attr_reader :name, :capacity, :songs, :customers, :customer_tab

  def initialize(name, capacity, songs)
    @name = name
    @capacity = capacity
    @songs = songs
    @customers = []
    @total_spend = 0
    @customer_tab = Hash.new(0)
  end

  def set_entrance_fee(amount)
    @entrance_fee = amount
  end

  def add_customer(customer)
    return if @customers.count >= @capacity
    @customers << customer
    @customer_tab[customer] = 0
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

  def total_spend
    return @total_spend
  end

  def increase_total_spend(amount)
    @total_spend += amount
  end

  def check_customer_tab(customer)
    @customer_tab[customer]
  end

  def increase_customer_tab(customer, amount)
    @customer_tab[customer] += amount
  end

end
