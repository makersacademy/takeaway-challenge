require 'menu'

describe Menu do 
  dish_object = Dish.new("kebab", 3.50)
  describe '#add_dish' do
    it 'adds dish object to list of dishes' do 
      subject.add_dish(dish_object)
      expect(subject.dishes[0]).to eq dish_object
    end 
  end 

  # describe '#read_menu' do 
  #   it 'print back the menu' do 
  #     subject.add_dish(dish_object)
  #     expect(subject.read_menu).to eq "Dish: kebab Price: £3.5"
  #   end 
  # end 
end 
