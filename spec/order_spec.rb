require 'order'

describe Order do

  let(:restaurant_double) {double :restaurant}
  let(:display_double) {double :display}
  let(:order) {Order.new(display_double)}
  before :each do
    allow(display_double).to receive(:menu) {"1. burger (£10)\n2. pizza (£7)\n3. fish (£12)"}
  end

  context "#request_menu" do

    it "returns a string" do
      expect(order.request_menu(restaurant_double)).to be_a(String)
    end

    it "returns string containing available dishes" do
      
      expect(order.request_menu(restaurant_double)).to eq "1. burger (£10)\n2. pizza (£7)\n3. fish (£12)"

    end



  end

end
