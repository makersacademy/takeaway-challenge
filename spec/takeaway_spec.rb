require 'takeaway'
require 'order'

describe Takeaway do
  let(:menu) {double :menu}
  subject(:takeaway) {described_class.new(menu)}
  let(:order) {double :order}
  let(:dish) {double :dish}

  describe '#view menu' do
    it 'view_menu method returns list of dishes' do
      allow(menu).to receive(:print_menu).and_return(@dishes)
      expect(takeaway.view_menu).to eq menu.print_menu
    end
  end

  describe '#creating an order' do
    it 'order is nil until create_order is called' do
      expect(takeaway.order).to eq nil
    end

    it 'calling create order method creates new instance of order' do
      expect(takeaway.create_order).to be_instance_of(Order)
    end
  end

  describe '#placing an order' do
    it 'raises error if no order has been created' do
      message = "Please create an order first"
      expect{ takeaway.place_order }.to raise_error message
    end

    it 'raises error if nothing is in the order basket' do
      takeaway.create_order
      message = "Please create an order first"
      expect{ takeaway.place_order }.to raise_error message
    end

    before do
      allow(dish).to receive(:name).and_return("Edamame")
      allow(dish).to receive(:price).and_return(3.50)
    end

    it 'raises error if payment total and order total do not tally' do
      allow(takeaway).to receive(:sum_basket) {3}
      takeaway.create_order
      takeaway.order.add_item(dish, Order::DEFAULT_QUANTITY)
      message = "Please re-calculate order total"
      expect{ takeaway.place_order }.to raise_error message
    end

    it 'confirms order after placing it' do
      takeaway.create_order
      takeaway.order.add_item(dish, Order::DEFAULT_QUANTITY)
      expect(takeaway.place_order).to eq ("Thank you for your order")
    end

  end

end
