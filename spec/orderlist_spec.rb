require 'orderlist'

describe OrderList do
  let(:item_ordered) { double :food }
  let(:order) { double :order }
  let(:order_class) { double :order_class, new: order}
  let(:kernel) { double :kernel }
  let(:menu) { double :menu }
  let(:restaurant) { double :restaurant, menu: menu }
  let(:test_list) { OrderList.new(restaurant, kernel) }
  describe "#new_order" do
    it "starts the process of taking an order, lets user immediately quit" do
      expect(kernel).to receive(:gets).and_return("quit")
      test_list.new_order
    end

    it "displays the menu when prompted, then lets user quit" do
      expect(kernel).to receive(:gets).and_return("1")
      expect(menu).to receive(:display_all)
      expect(kernel).to receive(:gets).and_return("quit")
      test_list.new_order
    end

    it "feeds choices through to #add in the order" do
      skip
    end


    it "pushes order notification to the customer" do
      skip
    end
  end
end