require 'menu'

describe Menu do
  let (:dish_1) {double (:dish)}
  context 'menu class' do
    it 'has an empty list of dishes by defualt' do
      expect(subject.dishes).to eq([]) 
    end

    it 'adds a dish' do
      subject.add(dish_1)
      expect(subject.menu).to eq([dish_1])
    end

    it 'removes a dish' do
      expect(subject.remove(dish_1)).to eq(dish_1)
    end

    it 'has a list of dishes' do
      ramen = double("Dish", :name => "Ramen Noodles", :price => 4.99)
      gyoza = double("Dish", :name => "Chicken Gyoza", :price => 3.99)

      subject.add(ramen)
      subject.add(gyoza)

      expect(subject.menu).to eq([ramen, gyoza])
    end
  end
end