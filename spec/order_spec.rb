require 'order'

describe Order do
  let(:dish_one) { double(:dish, name: "Pizza", price: 5) }
  let(:dish_two) { double(:dish, name: "Burger", price: 3) }
  let(:dish_three) { double(:dish, name: "Salad", price: 2) }
  let(:dish_four) { double(:dish, name: "Dip", price: 1) }

  it 'starts out empty' do
    expect(subject.meal).to be_empty
  end

  it 'can select several dishes' do
    subject.select(dish_two)
    subject.select(dish_three)
    expect(subject.meal).to include(dish_two, dish_three) 
  end

  it 'can check the total cost of the meal' do
    subject.select(dish_one)
    subject.select(dish_four)
    expect(subject.total).to eq 6
  end
end
