require 'menu'

describe Menu do
  let(:dish_name) { 'Jalfrezi' }
  let(:dish_price) { 7.99 }
  let(:dish) { Dish.new(dish_name, dish_price) }

  describe '#add_dish' do
    before { subject.add_dish(dish) }
    it 'adds a dish that can be listed' do
      expect(subject.list_dishes).to include(dish_name, dish_price.to_s)
    end
  end
  
end
