class Customer

  attr_reader :name, :age, :money, :fav_song

  def initialize(name, age, money, fav_song)
    @name = name
    @age = age
    @money = money
    @fav_song = fav_song
  end

  def remove_money(amount)
    return if amount > @money
    @money -= amount
  end


end
