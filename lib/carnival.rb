class Carnival
  attr_reader :name, :duration, :rides
  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_rider
  rides_in_order = @rides.sort_by do |ride|
      ride.times_ridden
    end
    rides_in_order.last
  end

  def most_profitable_ride
    rides_by_profit = @rides.sort_by do |ride|
      ride.total_revenue
    end
    rides_by_profit.last
  end

  def total_revenue
    sum = 0
    @rides.each do |ride|
      sum += ride.total_revenue
    end
    sum
  end
end