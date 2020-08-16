require 'order'

describe Order do
  it "Expects order to be an instance of Order class" do
    expect(subject).to be_an_instance_of(Order)
  end

  it "Expects order to respond to add_to_order" do
    expect(subject).to respond_to(:add_to_order)
  end

  it "Expects order to respond to total_of_order" do
    expect(subject).to respond_to(:order_total)
  end

  let(:order) {Order.new}

  describe '#add_to_order' do
    it "Expects item to be added to an order" do
      expect{(order.add_to_order("Pizza"))}.to change { order.order.count}.by (1)
    end
  end

  describe '#order_total' do
    it "Expects correct total of order" do
      order.add_to_order("Pizza")
      order.add_to_order("Cheeseburger")
      expect(order.order_total).to eq(12)
    end
  end
end
