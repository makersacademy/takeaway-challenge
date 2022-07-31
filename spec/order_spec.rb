require 'order'

describe Order do
  it 'initialises with an empty array' do
    expect(subject.order).to eq []
  end

  it 'displays the menu' do
    expect(subject.menu).to eq MENU
  end

  it 'pushes ordered items into the array' do
    subject.add_item(:tacos)
    expect(subject.order).to eq [:tacos]
  end

  it 'pushes multiple ordered items into the array at once' do
    subject.add_item(:tacos, 3)
    expect(subject.order).to eq [:tacos, :tacos, :tacos]
  end

  it 'calculates the total of the order' do
    subject.add_item(:burger, 2)
    subject.add_item(:fries, 4)
    subject.add_item(:ice_cream, 2)
    expect(subject.total).to eq 40
  end

end
