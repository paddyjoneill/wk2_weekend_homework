class Bar

  attr_reader :name, :stock

  def initialize(name)
    @name = name
    @stock = Hash.new(0)
  end

  def add_drink(drink, amount)
      if @stock.include?(drink)
        @stock[drink] += amount
      else
        @stock[drink] = amount
      end
  end

  def remove_drink(drink)
    if @stock.include?(drink) && @stock[drink] >0
      @stock[drink] -= 1
    end
  end

  def total_stock
    total_stock = 0
    for drink in @stock.keys
      total_stock += @stock[drink]
    end
    return total_stock
  end

  def total_stock_value
    total_stock_value = 0
    for drink in @stock.keys
      total_stock_value += (drink.price * @stock[drink])
    end
    return total_stock_value
  end

end
