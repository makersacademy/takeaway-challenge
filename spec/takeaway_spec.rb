require "takeaway"

describe Takeaway do

  subject(:takeaway) { described_class.new }
  
  before(:each) do
    @order = double(:order)
    allow(@order).to receive(:foods) { ["Chicken", "Sides"] }
  end

  describe "#initialze" do
    it "creates an array called menu on initalize" do
      expect(takeaway.menu).to be_a(Hash)
    end
  end

  describe "#show_menu" do
    it "return a hash of food items and their price" do
      expect(takeaway.show_menu).to eq({ Chicken: 5, Steak: 8, Fish: 6, Sides: 4 })
    end
  end

  describe "#place_order" do
    it 'should take an order and calculate the cost of the order' do
      time = (Time.now + 60 * 60).strftime("%H:%M")
      expect(subject.place_order(@order)).to eq "Thank you! Your order will cost £9 and will be delivered before #{time}"
    end

  end

end
