require 'takeaway'

describe Takeaway do
  let(:order) { { 'Chips' => 3, 'Fish' => 2 } }
  let(:menu) { { 'Chips' => 2.50, 'Fish' => 4.75 } }
  let(:messager) { double :messager }

  subject(:takeaway) { Takeaway.new(menu, messager) }

  before do
    allow(menu).to receive(:price_of) { |name| menu[name] }
    allow(order).to receive(:quantity_of) { |name| order[name] }
  end

  it 'is initialized with a menu' do
    expect(takeaway.menu).to be menu
  end

  it 'calculates the price of an order' do
    expect(takeaway.calculate_price(order)).to eq 17
  end

  describe '#receive_order' do
    it 'fails if the order is empty' do
      order = double(order, empty?: true)
      expect{ takeaway.receive_order(order, 0) }.to raise_error 'Cannot process an empty order'
    end

    it 'fails if any item is not on the menu' do
      order['Saveloy'] = 2
      expect{ takeaway.receive_order(order, 0) }.to raise_error 'Saveloy is not on the menu'
    end

    it 'accepts the correct payment' do
      expect{ takeaway.receive_order(order, 17) }.not_to raise_error
    end

    it 'fails if not given the correct payment' do
      expect{ takeaway.receive_order(order, 20) }.to raise_error "Incorrect payment: the order total is £17.00"
    end
  end
end
