require 'menu'

describe Menu do
  it 'has a hash of items that can be bought' do
    expect(subject.list).to eq(Burger: 5, Pizza: 10, Coke: 1)
  end

  it 'can add an ordered item to a list' do
    subject.add(:Burger)
    expect(subject.current_order).to eq(Burger: 1)
  end

  it 'can add multiple ordered items to a list' do
    subject.add(:Burger)
    subject.add(:Coke)
    expect(subject.current_order).to eq(Burger: 1, Coke: 1)
  end

  it 'cannot add items that are not on the menu' do
    expect do
      subject.add(:Lobster)
    end.to raise_error 'Sorry, that item isn\'t on our menu'
  end

  it 'can sum the prices of the ordered items' do
    subject.add(:Burger)
    subject.add(:Coke, 2)
    expect(subject.total).to eq 7
  end

  it 'can send items to checkout' do
    subject.add(:Burger)
    subject.add(:Pizza)
    expect(subject).to receive(:send_message)
    expect(subject.complete).to eq 'You ordered: Burger: 1 Pizza: 1 at a cost'\
                                   ' of: £15'
  end

  it 'can add items to the menu' do
    subject.add(:Burger, 2)
    expect(subject.current_order).to eq(Burger: 2)
  end
end
