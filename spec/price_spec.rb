require "price"

describe Price do

  subject { Price.new(menu)}
  let(:order) { double :order, order: {burger: 2, chips: 1} }
  let(:order2) { double :order, order: {burger: 4, :"onion rings" => 3}}
  let(:menu) { double :menu, items: [{dish: "burger", price: 4}, {dish: "chips", price: 2}, {dish: "onion rings", price: 2}] }

  describe '#item_price' do

    it "should return the price of a burger" do
      expect(subject.item_price("burger")).to eq(4)
    end

  end

  describe '#total' do

    it "should return total of order" do
      expect(subject.total(order.order)).to eq(10)
    end

    it "should return total of order2" do
      expect(subject.total(order2.order)).to eq(22)
    end

  end

end
