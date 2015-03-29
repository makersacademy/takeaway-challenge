require 'order'

describe Order do
  let(:menu) { double :menu, list: { some_food: 0.0, more_food: 0.0 } }

  it 'raises error if item does not exist in the menu' do
    expect do
      subject.add(:dodgy_food, menu)
    end.to raise_error 'Invalid Dish, Available Dishes in the Menu'
  end

  it 'keeps track of items added' do
    subject.add(:some_food, menu)
    subject.add(:more_food, menu)
    expect(subject.list).to eq [:some_food, :more_food]
  end
end
