require 'list'

describe List do
  let(:dish_one) { double(:dish, name: "Pizza", price: 5) }
  let(:dish_two) { double(:dish, name: "Burger", price: 3) }
  let(:dish_three) { double(:dish, name: "Salad", price: 2) }

  it 'can add a dish to the list' do
    subject.add_dish(dish_one)
    expect(subject.view).to include(dish_one) 
  end

end
