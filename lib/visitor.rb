class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.split("$")[1].to_i
    @preferences = []
  end
end
