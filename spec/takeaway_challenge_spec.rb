require 'takeaway_challenge'

describe Takeaway do
  subject(:takeaway) { described_class.new(order: order) }
  let(:order) { double(:order)}
  let(:dishes) { {fish: 1, chips: 2}}

  describe "#list_dishes" do
    it 'shows a list of dishes with prices' do
      menu = "Ramen: £5.60, Chicken: £4.20, Salad: £3.99"
      expect(subject.list_dishes).to eq(menu)
    end
  end

  describe "#place_order" do 
    it "allows customers to place a number of orders" do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end
end