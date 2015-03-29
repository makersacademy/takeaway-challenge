require 'order'

describe Order do
  it 'is empty when initialized' do
    expect(subject.list).to eq []
  end

  it 'keeps track of items added' do
    subject.add(:some_food)
    subject.add(:more_food)
    expect(subject.list).to eq [:some_food, :more_food]
  end

  it 'gives total order list with prices' do
    menu = double :menu, list: { some_food: 0.0, more_food: 0.0 }
    subject.add(:some_food)
    subject.add(:more_food)
    expect(subject.priced_list(menu)).to eq(some_food: 0.0, more_food: 0.0)
  end

  it 'returns total sum of the order' do
    menu = double :menu, list: { some_food: 11.0, more_food: 1.5 }
    subject.add(:some_food)
    subject.add(:more_food)
    expect(subject.total_price(menu)).to eq 12.5
  end
end
