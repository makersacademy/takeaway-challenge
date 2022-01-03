require 'dish'
describe Dish do
    subject(:dish) {described_class.new(dish)}
    let(:dish) {Dish.new('Hamburger', 5)}
    
    it {is_expected.to have_attributes(name: 'Hamburger', price: 5)}
end