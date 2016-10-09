require 'order'

describe Order do

  subject(:order) {described_class.new}

  it " creates an instance of the class" do
    expect(order).to be_instance_of(Order)
  end

  describe '#initialize' do
    it "with an instance of the menu class" do
      expect(order.menu).to be_instance_of(Menu)
    end

    it "has an empy current order list at the start" do
      expect(order.current_order.empty?).to be true
    end

    it "has zero order total" do
      expect(order.order_total).to be(0)
    end
  end

  describe '#select_dish' do
    it "receives an argument, the item number" do
      expect(order).to respond_to(:select_dish).with(1).argument
    end

    it 'given item number as argument, include dish hash in current_order' do
      order.select_dish(1)
      expect(order.current_order).not_to be_empty
    end

    it 'select a number of dishes' do
      order.select_dish(2)
      order.select_dish(3)
      expect(order.current_order.size).to be 2
    end
  end

  describe '#total_price' do
    it "calculates the total price of selected items" do
      order.select_dish(3)
      order.select_dish(4)
      expect(order.total_price).to eq 23
    end

  end


end
