require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu, price: {chips: 3}) }
  let(:dish) { double(:dish) }
  let(:quantity) { double(:quantity) }

  describe "#add" do
    it "adds a dish to an order" do
      order.add(dish,quantity)
      expect(order.has?(dish)).to eq true
    end
  end

  describe "#remove" do
    it "removes a dish from an order" do
      order.add(dish,quantity)
      order.remove(dish)
      expect(order.has?(dish)).to eq false
    end
  end

  describe "#summary" do
    it "summarises the order and shows the total cost" do
      summary = "Order Summary\n" +
      "============================================================\n"+
      "Dish                                 Price   Qty       Total\n"+
      "------------------------------------------------------------\n"+
      "chips                               £ 3.00     3    £   9.00\n"+
      "============================================================\n"+
      "                                        Total cost: £   9.00"
      order.add(:chips,3)
      expect(order.summary).to eq summary
    end
  end


end
