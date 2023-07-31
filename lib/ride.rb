class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log
  def initialize(ride_info)
    @name = ride_info[:name]
    @min_height = ride_info[:min_height]
    @admission_fee = ride_info[:admission_fee]
    @excitement = ride_info[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  # def rider_log
  # end

  def board_rider(rider)

    if rider.tall_enough?(@min_height) && rider.preferences[0] == @excitement
      @rider_log[rider] += 1
      rider.pay_for_ride(@admission_fee)
      @total_revenue += @admission_fee
    end
  end


end
