require 'list'

describe List do
  let(:dish_one) { double(:dish, name: "Pizza", price: 5) }
  let(:dish_two) { double(:dish, name: "Burger", price: 3) }
  let(:dish_three) { double(:dish, name: "Salad", price: 2) }
  let(:menu) { [{ name: "Pizza", price: 5 }, { name: "Burger", price: 3 }, { name: "Salad", price: 2 }] }

  it 'can add a dish to the list' do
    subject.add_dish(dish_one)
    expect(subject.list).to include(dish_one) 
  end

  context 'has three dishes available' do
    before do
      subject.add_dish(dish_one)
      subject.add_dish(dish_two)
      subject.add_dish(dish_three)
    end
    it 'shows a list of dishes with prices' do
      expect(subject.view).to eq menu
    end
  end

end
