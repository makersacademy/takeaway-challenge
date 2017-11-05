require "order"

describe Order do

  let(:restaurant) { double(:restaurant) }
  subject(:order) { described_class.new(restaurant) }

  describe "#initialize" do
    it "ensures it gets initialized with a total =0" do
      expect(subject.total).to eq(0)
    end

    it "ensures it gets initialized with no items" do
      expect(subject.items).to eq([])
    end

    it "ensures it gets initialized with a restaurant" do
      expect(subject.restaurant).to eq(restaurant)
    end

    it "ensures a new order gets initialized with an id number" do
      expect(subject.id).to be_kind_of(Numeric)
    end

    order1 = Order.new("restaurant1")
    order2 = Order.new("restaurant2")
    order3 = Order.new("restaurant3")
    order4 = Order.new("restaurant4")

    [order2.id - order1.id, order3.id - order2.id, order4.id - order3.id].each do |id_difference|
      it "ensures that order id's increase by one with each order being made" do
        expect(id_difference).to eq(1)
      end
    end
  end
end
