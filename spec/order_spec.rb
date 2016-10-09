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


end
