require 'order'

describe Order do

  let(:menu) {{"Burger"=>8}}
  subject(:order) { described_class.new(menu) }

  describe "#add" do
    it "raises error if item is unvailable " do
      expect do
        order.add("Icecream")
      end.to raise_error("Item is not on the menu")
    end

    it "adds selected items to the basket " do
      subject.add("Burger", 2)
      expect(order.basket).to eq ({"Burger"=>2})
    end
  end


  describe "#calculate_total" do
    it 'checks if order total is the sum of items added' do
      order.add("Burger")
      order.add("Burger")
      expect(order.calc_total).to eq 16
    end
  end

end
