require 'menu'

describe Menu do
  let(:dish_name) { 'Jalfrezi' }
  let(:dish_price) { 7.99 }
  let(:dish) { Dish.new(dish_name, dish_price) }
  before { subject.add_dish(dish) }

  describe '#add_dish' do
    it 'adds a dish that can be listed' do
      expect(subject.list_dishes).to include(dish_name, dish_price.to_s)
    end
  end

  describe '#select_dish' do
    it 'allows us to select a dish by name' do
      expect(subject.select_dish(dish_name)).to eq dish
    end
  end

end
