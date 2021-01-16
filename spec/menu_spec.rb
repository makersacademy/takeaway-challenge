require 'menu'

describe Menu do
  let(:dish_name) { 'Jalfrezi' }
  let(:dish_price) { 7.99 }
  let(:dish) { Dish.new(name, price) }

  describe '#add_dish' do
    before { subject.add_dish(dish) }
    it 'should add a dish to the available dishes' do
      expect(subject.list_dishes).to include(dish_name, dish_price)
    end
  end
end
