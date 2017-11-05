require "order"

describe Order do
  let(:dish) { double(:dish, name: "burger", price: 7) }
  let(:restaurant) { double(:restaurant, menu: [dish]) }
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

  describe "#add_item" do
    it "raises error if item doesn't exist at the restaurant" do
      expect { subject.add_item("pizza", 2) }.to raise_error("This item doesn't exist at this restaurant.")
    end
    it "expects @items to be updated every time a valid item is added to the order" do
      subject.add_item("burger", 1)
      expect(subject.items).to include(dish)
    end
    it "expects @items to be updated every time a valid item is added to the order w/quantity" do
      subject.add_item("burger", 2)
      expect(subject.items).to eq([dish, dish])
    end
    it "updates @total with the correct price when passing two burgers" do
      subject.add_item("burger", 2)
      expect(subject.total).to eq(14)
    end
    it "updates @total with the correct price when passing seven burgers" do
      subject.add_item("burger", 7)
      expect(subject.total).to eq(49)
    end
  end
end
