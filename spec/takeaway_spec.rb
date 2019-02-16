require './lib/takeaway'

describe Takeaway do
  let(:rice) { { name: :rice, price: 3 } }

  it 'has a menu of dishes' do
    allow(subject).to receive(:dishes).and_return([rice])
    expect(subject.dishes).to include rice
  end

  it 'allows an order to be initiated' do
    subject.new_order
    expect(subject.order).to be_a Order
  end

  it 'allows an order to be placed' do
    subject.new_order
    subject.order.add_dish(rice)
    subject.place_order
    expect(subject.order.placed?).to eq true
  end

  it 'shows its menu for browsing' do
    expect(subject.menu).to include rice
  end

  it 'adds a dish to its order' do
    subject.new_order
    subject.add_to_order(rice)
    expect(subject.order.dishes).to include rice
  end

  it 'shows a list of generic options' do
    expect(subject.options).to include '[S]how order'
  end
end
