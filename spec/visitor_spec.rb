require './lib/visitor'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe "#initialize" do
    it "instantiates a new object" do
      expect(@visitor1).to be_an_instance_of(Visitor)
      expect(@visitor2).to be_an_instance_of(Visitor)
      expect(@visitor3).to be_an_instance_of(Visitor)

    end

    it "has attributes" do
      expect(@visitor1.name).to eq('Bruce')
      expect(@visitor1.height).to eq(54)
      expect(@visitor1.spending_money).to eq(10)
      expect(@visitor1.preferences).to eq([])
    end
  end

  describe "#Add preferences" do
    it "adds a preference to the visitors list" do
      expect(@visitor1.preferences).to eq([])
      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:thrilling)
      expect(@visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end

  describe "tall_enough" do
    it "returns if visitor is ttall enough for rides" do
      expect(@visitor1.tall_enough?(54)).to eq(true)
      expect(@visitor2.tall_enough?(54)).to eq(false)
      expect(@visitor3.tall_enough?(54)).to eq(true)
      expect(@visitor1.tall_enough?(64)).to eq(false)
    end
  end
end




