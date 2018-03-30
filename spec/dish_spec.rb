require 'dish'

describe Dish do
  context 'has name and price' do
    it { expect(subject).to respond_to :name }
    it { expect(subject).to respond_to :price }

    context 'generates random dish' do

      it "generates pizza dish" do
        dish = Dish.rand_pizza_dish
        expect([
          'Pepperoni Feast',
          'Texan BBQ',
          'Meat feast',
          'Hawaiian',
          'Margarita',
          'Quarter farmature'
        ]).to include(dish.name)
        expect([8.30, 9.00, 10.50]).to include(dish.price)
      end
      it 'generates paste dish' do
        dish = Dish.rand_paste_dish
        expect([
          'Paste with shrimps',
          'Vegetarian paste',
          'Paste with octopus',
          'Bolognese',
          'Paste carbonara'
        ]).to include(dish.name)
        expect([8.20, 7.90, 10.00]).to include(dish.price)
      end
      it 'generates side dish' do
        dish = Dish.rand_side_dish
        expect([
          'Smash potato',
          'Rise',
          'Fried potato'
        ]).to include(dish.name)
        expect([3.50, 4.00, 5.00]).to include(dish.price)
      end
      it 'generates salade dish' do
        dish = Dish.rand_salade_dish
        expect([
          'Caesar',
          'Turkey with griled vegetables',
          'Mix',
          'Russian'
        ]).to include(dish.name)
        expect([4.20, 5.30, 5.85]).to include(dish.price)
      end
    end
  end
end
