class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.split("$")[1].to_i
    @preferences = []
  end

  def add_preference(ride_type)
    @preferences << ride_type
  end

  def tall_enough?(height_limit)
    difference = @height - height_limit
    if difference >= 0
      true
    else
      false
    end
  end
end
