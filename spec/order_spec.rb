require 'order'

describe Order do
  let(:alex) { double :customer, name: 'Alex' }
  let(:order) { described_class.new alex }
  let(:murtabak) { double :dish, name: 'Murtabak', price: 10 }

  before(:each) do
    order.add_dish(murtabak)
  end

  it 'is linked to a Customer when created' do
    expect(order.customer).to eq alex
  end

  # Drinks?
  it 'can add an item' do
    expect(order.ordered_dishes.include?(murtabak)).to eq true
  end

  it 'can remove an item' do
    order.remove_dish(murtabak)
    expect(order.ordered_dishes.include?(murtabak)).to eq false
  end

  it 'can checkout' do
    order.checkout
    expect(order.checked_out).to eq true
  end

  it 'can be ready' do # (After restaurant has cooked and packaged)
    expect(order.ready).to eq false
    order.ready_for_delivery
    expect(order.ready).to eq true
  end
end
