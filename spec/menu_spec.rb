require 'menu'

describe Menu do 
  dish_object = Dish.new("kebab", 3.50)
  describe '#addDish' do
    it 'adds dish object to list of dishes' do 
      subject.addDish(dish_object)
      expect(subject.dishes[0]).to eq dish_object
    end 
  end 

  describe '#readMenu' do 
    it 'print back the menu' do 
    subject.addDish(dish_object)
    expect(subject.readMenu).to eq "Dish: kebab Price: £3.5"
    end 
  end 

end 