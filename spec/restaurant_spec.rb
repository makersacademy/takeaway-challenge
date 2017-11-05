require "restaurant"

describe Restaurant do

  let(:dish) { double(:dish, name: "burger", price: 7) }
  subject(:restaurant) { described_class.new("mcdonalds") }

  describe "#initialize" do
    it "ensures a new restaurant gets initialized with a name" do
      expect(restaurant.name).to eq("mcdonalds")
    end
  end

  describe "#add_dish" do
    it "expects add_dish to take one argument" do
      expect(restaurant).to respond_to(:add).with(1).argument
    end

    it "expects add_dish to add a dish to the restaurant's menu" do
      restaurant.add(dish)
      expect(restaurant.menu).to include(dish)
    end
  end

  describe "#remove_dish" do
    it "expects remove_dish to take one argument" do
      expect(restaurant).to respond_to(:remove).with(1).argument
    end

    it "expects remove_dish to remove a dish from the restaurant's menu" do
      restaurant.add(dish)
      restaurant.remove(dish)
      expect(restaurant.menu).not_to include(dish)
    end
  end

  describe "#print_menu" do
    it "expects show print to show a list of one dish name and price" do
      subject.add(dish)
      expect { subject.print_menu }.to output("burger: £7\n").to_stdout
    end
    it "expects show print to show a list of dish names and prices" do
      subject.add(dish)
      dish2 = double(:dish, name: "pizza", price: 10)
      subject.add(dish2)
      expect { subject.print_menu }.to output("burger: £7\npizza: £10\n").to_stdout
    end
  end

  describe "#start_order" do
    it "expects restaurant to respond to start_order" do
      expect(subject).to respond_to(:start_order)
    end
    it "returns instance of another class" do
      Order ||= double(:Order)
      allow(Order).to receive(:new).with(anything()).and_return("instance")
      expect(restaurant.start_order).to eq("instance")
    end
  end
end
