require 'order'

describe Order do

  it 'returns a hash of menu items when requested' do
    expect(subject.menu).to be_a Hash
  end

  it 'can track items added to an order' do
    subject.add(:chicken)
    expect(subject.ordered_items).to include :chicken
  end

  it 'can track the running total of an order' do
    subject.add(:chicken)
    expect(subject.total_price).to include 8
  end

  it 'should calculate the total cost of the order' do
    subject.add(:chicken)
    subject.add(:salad)
    expect(subject.total_order).to eq 14
  end

end