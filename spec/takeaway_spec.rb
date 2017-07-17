require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(order) }
  let(:menu) { described_class::MENU }
  let(:item) { "Pepperoni pizza" }
  let(:quantity) { 1 }
  let(:price) { 11.99 }
  let(:order) { double :order}

  it 'starts with an order' do
    expect(takeaway.order).not_to be_nil
  end

  it 'can print the menu' do
    expect(takeaway.view_menu).to eq menu
  end

  it 'lets the customer add an item to their order' do
    expect(order).to receive(:add)
  takeaway.add_item(item, quantity, price)
  end

  it 'finalises the order with the total cost' do
    expect(order).to receive(:complete_order)
    takeaway.finalise_order
  end
end
