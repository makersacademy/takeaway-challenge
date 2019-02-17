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

  it 'shows a list of all items ordered' do
    subject.add_dish(rice)
    expect(subject.show_items).to include rice
  end

  it 'prevents empty orders from being placed' do
    subject.place
    expect(subject.placed?).to eq false
  end

  it 'has no items inside once placed' do
    subject.add_dish(rice)
    subject.place
    expect(subject.dishes).to eq []
  end

  it 'has a zero total once placed' do
    subject.add_dish(rice)
    subject.place
    expect(subject.total).to eq 0
  end

end
