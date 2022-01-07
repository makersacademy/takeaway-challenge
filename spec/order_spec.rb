require 'order'

describe Order do
  let(:dish_two) { double(:dish, name: "Burger", price: 3) }
  let(:dish_three) { double(:dish, name: "Salad", price: 2) }

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'starts out empty' do
    expect(subject.meal).to be_empty
  end

  it 'can select several dishes' do
    subject.select(dish_two)
    subject.select(dish_three)
    expect(subject.meal).to include(dish_two, dish_three) 
  end

end
