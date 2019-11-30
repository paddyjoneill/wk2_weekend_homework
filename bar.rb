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

end
