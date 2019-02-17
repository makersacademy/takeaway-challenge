require './lib/takeaway'

describe Takeaway, error_on_call: [Order] do
  let(:rice) { { name: :rice, price: 3 } }
  let(:order) { { total: 0, dishes: [] } }

  it 'has a menu of dishes' do
    allow(subject).to receive(:dishes).and_return([rice])
    expect(subject.dishes).to include rice
  end

  it 'shows a list of selectable items' do
    expect(subject.food_menu).to be_a Array
  end

  it 'places an order' do
    subject.new_order(order)
    allow(order).to receive(:place)
    subject.place_order(order)
    allow(order).to receive(:placed?) { true }
    expect(subject.order.placed?).to eq true
  end

  it 'adds a dish to its order' do
    allow(order).to receive(:dishes) { [rice] }
    expect(order.dishes).to include rice
  end

  it ''

end
