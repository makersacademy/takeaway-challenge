require 'menu'

RSpec.describe Menu do

  describe '#list' do
    before(:each) do
      subject.dishes.push(Dish.new("Tikka Masala", 8.99),
                          Dish.new("Burger", 10.99),
                          Dish.new("Chicken Wrap", 7.99),
                          Dish.new("Sirloin Steak", 15.99))
    end
    it 'lists all dishes and their prices' do
      expect(subject.list).to eq [["Tikka Masala", 8.99],
                                       ["Burger", 10.99],
                                       ["Chicken Wrap", 7.99],
                                       ["Sirloin Steak", 15.99]]
    end
  end
end
