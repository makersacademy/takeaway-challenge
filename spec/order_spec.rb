require "order"

describe Order do
  let(:dish) { double(:dish, name: "burger", price: 7) }
  let(:restaurant) { double(:restaurant, menu: [dish], name: "mcdonalds") }
  let(:SMS) { double(:SMS) }
  let(:sms) { double(:sms) }
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
      subject.add_item("burger", 1)
      expect(subject.total).to eq(7)
    end
    it "updates @total with the correct price when passing seven burgers" do
      subject.add_item("burger", 7)
      expect(subject.total).to eq(49)
    end
  end

  describe "#remove_item" do
    it "raises error if trying to remove item not in order" do
      expect { subject.remove_item(dish) }.to raise_error("This item is not in this order.")
    end
    it "removes an item from the @items list if item is there" do
      subject.add_item("burger", 1)
      subject.remove_item("burger")
      expect(subject.items).not_to include(dish)
    end
    it "removes just one item from the @items list if there are multiple items there" do
      subject.add_item("burger", 6)
      subject.remove_item("burger")
      expect(subject.items).to include(dish)
    end
    it "ensures the total is updated when removing an item" do
      subject.add_item("burger", 2)
      subject.remove_item("burger")
      expect(subject.total).to eq(7)
    end
  end

  describe "#check_total" do
    it "prints the order summary" do
      subject.add_item("burger", 1)
      subject.add_item("burger", 1)
      expect { subject.check_total }.to output("Order Summary:\nburger: £7\nburger: £7\nYour total is £14\n").to_stdout
    end
  end

  describe "#pay" do
    before { allow(SMS).to receive(:new).and_return(sms) }
    before { allow(sms).to receive(:send_sms) }

    it "raises error if providing less money than total" do
      subject.add_item("burger", 1)
      expect { subject.pay(1) }.to raise_error("Sorry, you are missing £6.")
    end
    it "completes order if giving exact money" do
      subject.add_item("burger", 1)
      expect { subject.pay(7) }.to output("Your order from mcdonalds is complete for £7.\n").to_stdout
    end
    it "completes order and gives change if giving too much money" do
      subject.add_item("burger", 1)
      expect { subject.pay(12) }.to output("Your order from mcdonalds is complete for £7.\nYour change is £5.\n").to_stdout
    end
  end
end
