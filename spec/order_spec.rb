require 'order.rb'

describe Order do

  let(:order) { described_class.new }

  context "for incrementing" do

    it "should return an empty hash if nothing is ordered" do
      expect(order.make).to eq({})
    end

    it "should add a new item to the order with count 1" do
      expect(order.add_item("duck")).to eq({:duck => 1})
    end

    it "should increment the count of an item by 1 if added again" do
      order.add_item("duck")
      expect(order.add_item("duck")).to eq({:duck => 2})
    end

    it "should add a new item to the order with count 1 when added" do
      order.add_item("duck")
      expect(order.add_item("beef")).to eq({:duck => 1, :beef => 1})
    end

  end

  context "for checking if item is on menu" do

    it "should only add item to order if chosen item is on restuarant's menu" do
      expect(order.add_item("duck")).to eq({:duck => 1})
    end

    it "should raise error if item item is not on restuarant's menu" do
      expect{order.add_item("sheep")}.to raise_error "Error: sheep not found on menu"
    end

  end

  context "initializing" do

    it "should initialize with an empty order" do
      expect(order.in_progress).to eq ({})
    end

  end

end
