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
end