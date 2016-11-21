require 'order.rb'

describe Order do

  let(:order) { described_class.new }
  let(:number) { double(:number) }
  let(:menu) { double(:menu) }
  let(:duck) { double(:duck) }
  let(:beef) { double(:beef) }
  let(:fish) { double(:fish) }

  context "for incrementing" do

    it "should return an empty hash if nothing is ordered" do
      expect{(order.confirm(number))}.to raise_error("Error: Nothing in your order!")
    end

    it "should add a new item to the order with count 1" do
      allow(duck).to receive(:to_sym).and_return(:duck)
      expect(order.add_item(duck)).to eq({:duck => 1})
    end

    it "should increment the count of an item by 1 if added again" do
      allow(duck).to receive(:to_sym).and_return(:duck)
      order.add_item(duck)
      expect(order.add_item(duck)).to eq({:duck => 2})
    end

    it "should add a new item to the order with count 1 when added" do
      allow(duck).to receive(:to_sym).and_return(:duck)
      allow(beef).to receive(:to_sym).and_return(:beef)
      order.add_item(duck)
      expect(order.add_item(beef)).to eq({:duck => 1, :beef => 1})
    end

  end

  context "for checking if item is on menu" do

    it "should only add item to order if chosen item is on restuarant's menu" do
      allow(duck).to receive(:to_sym).and_return(:duck)
      expect(order.add_item(duck)).to eq({:duck => 1})
    end

    it "should raise error if item is not on restuarant's menu" do
      expect{order.add_item(:sheep)}.to raise_error "Error: sheep not found on menu"
    end

  end

  context "initializing" do

    it "should initialize with an empty order" do
      expect(order.in_progress).to eq ({})
    end

  end

  context "should calculate the correct price of an order" do

    it "should give give £0 for an empty order" do
      allow(menu).to receive(:read).and_return({:duck => 10,
             :beef => 20,
             :fish => 12})
      expect(order.price).to eq "£0"
    end

    it "should give give £10 for an order for one duck" do
      allow(duck).to receive(:to_sym).and_return(:duck)
      allow(menu).to receive(:read).and_return({:duck => 10,
             :beef => 20,
             :fish => 12})
      order.add_item(duck)
      expect(order.price).to eq "£10"
    end

    it "should give give £32 for an order for two ducks and one fish" do
      allow(duck).to receive(:to_sym).and_return(:duck)
      allow(fish).to receive(:to_sym).and_return(:fish)
      allow(menu).to receive(:read).and_return({:duck => 10,
             :beef => 20,
             :fish => 12})
      order.add_item(duck, 2)
      order.add_item(:fish)
      expect(order.price).to eq "£32"
    end

  end

  context "shows the itemized reciept of the order" do

    it "should show empty hash for empty order" do
      expect(order.breakdown).to eq ({})
    end

    it "should show duck, count of order and price of item" do
      allow(duck).to receive(:to_sym).and_return(:duck)
      order.add_item(duck, 2)
      expect(order.breakdown).to eq ({:duck => "2x £10"})
    end

  end

end
