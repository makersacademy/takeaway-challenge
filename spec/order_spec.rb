require "./lib/order.rb"

describe Order do
  subject(:order) {described_class.new}
  let(:item) {double(:item)}

  before do
      allow(item).to receive(:name)       {"Salmon roll"}
      allow(item).to receive(:price)      {7.0}
      allow(item).to receive(:reference)  {"A1"}
  end

  describe "#initialize" do

    it "creates a blank array to store the ordered items in" do
       expect(order.check_order.length).to eq 0
     end

  end

  describe "#add_item to order_list" do

    it "can store ordered items in the order list" do
      order.add_item(item)
      expect(order.check_order).to eq "#{item.reference}....#{item.name}....£#{item.price}"
    end

  end

  describe "#check_order" do

    it "shows a clone of the order list on request" do
      order.add_item(item)
      expect(order.check_order).to eq "#{item.reference}....#{item.name}....£#{item.price}"
    end

  end

  describe "#total" do

    it "calculates the total of the price of each item on the order list" do
      order.add_item(item)
      expect(order.total).to eq 7.0
    end

  end

  describe "#print_final_order" do

    it "returns a list of the items in the order and thier total cost" do
      order.add_item(item)
      expect(order.print_final_order).to eq "#{item.reference}....#{item.name}....£#{item.price}\nThe total cost of your order is: £#{order.total}."
    end

  end


end
