require 'menu'

RSpec.describe Menu do
  let(:dish) { instance_double Dish, name: "Tikka Masala", price: 8.99 }
  let(:dish2) { instance_double Dish, name: "Burger", price: 10.99 }
  let(:dish3) { instance_double Dish, name: "Chicken Wrap", price: 7.99 }
  let(:dish4) { instance_double Dish, name: "Sirloin Steak", price: 15.99 }
  describe '#list' do
    before(:each) do
      subject.dishes.push(dish, dish2, dish3, dish4)
    end
    it 'lists all dishes and their prices' do
      expect(subject.list).to eq [["Tikka Masala", 8.99],
                                       ["Burger", 10.99],
                                       ["Chicken Wrap", 7.99],
                                       ["Sirloin Steak", 15.99]]
    end
  end
  describe '#add' do
    it 'adds items to the menu' do
      subject.add(dish)
      subject.add(dish2)
      expect(subject.dishes.count).to eq 2
    end
  end
end
