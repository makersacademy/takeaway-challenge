require './lib/order'

describe Order do
  let(:rice) { { name: :rice, price: 3 } }

  it 'is initialized with a blank list of dishes' do
    expect(subject.dishes).to eq []
  end

  it 'returns the total amount' do
    subject.add_dish(rice)
    expect(subject.total).to eq 3
  end

  it 'adds a dish to its selected_dishes instance variable' do
    subject.add_dish(rice)
    expect(subject.dishes). to include rice
  end

  it 'can tell if it has been placed' do
    subject.add_dish(rice)
    subject.place
    expect(subject.placed?).to be true
  end

  it 'shows a list of all items within' do
    subject.add_dish(rice)
    expect(subject.show_items).to include rice
  end

  pending 'prevents empty orders from being placed' do
    expect(subject.place).to raise_error "Order empty!"
  end
end
