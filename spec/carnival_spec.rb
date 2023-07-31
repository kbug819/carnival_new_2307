require './lib/visitor'
require './lib/ride'
require './lib/carnival'


RSpec.describe Carnival do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor4 = Visitor.new('Jo', 64, '$25')


    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
    @visitor4.add_preference(:gentle)
    

    @carnival = Carnival.new("Dallas Fair", 14)
  end

  describe "#initialize" do
    it "instantiates a new object" do
      expect(@carnival).to be_an_instance_of(Carnival)
    end

    it "has attributes" do
      expect(@carnival.name).to eq("Dallas Fair")
      expect(@carnival.duration).to eq(14)
    end
  end

  describe "#add ride" do
    it "will add rides to carnival" do
      expect(@carnival.rides).to eq([])
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)
      expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
    end

    it "most popular ride" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor4)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)
      @ride2.board_rider(@visitor1)
      @ride2.board_rider(@visitor4)

      expect(@carnival.most_popular_rider).to eq(@ride1)
    end
  end

  describe "#most profitable ride" do
    it "returns the most profitable ride" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor4)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)
      @ride2.board_rider(@visitor1)
      @ride2.board_rider(@visitor4)
      expect(@carnival.most_profitable_ride).to eq(@ride2)
    end
  end

  describe "#total_revenue" do
    it "adds all revenue from event" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor4)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)
      @ride2.board_rider(@visitor1)
      @ride2.board_rider(@visitor4)
      expect(@carnival.total_revenue).to eq(16)
    end
  end
end