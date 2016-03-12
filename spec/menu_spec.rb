require 'menu'

describe Menu do
  let(:dish) {double(:Dish, name: :tuna, price: nil)}
  let(:dish_class) {double(:Dish_class, new: dish)}
  subject(:menu) {described_class.new(dish_class)}
  
  describe ' #create_dish' do 
    it '1. should create a instance of dish' do
      expect(dish_class).to receive(:new).with(instance_of(Symbol), instance_of(Float))
      menu.create_dish(:tuna, 4.56)
    end

    it '2. should save a new dish in dishes hash' do
      menu.create_dish(:tuna, 4.56)
      expect(menu.see_dishes).to include(dish.name => dish)
    end

    xit '3 should create a hash where the key is the name of the dish' do
      menu.create_dish(:tuna, 4.56)
    end
  end


  describe ' #see_dishes'  do
    
    it '1. should raise error if there are no dishes' do
      expect{menu.see_dishes}.to raise_error(RuntimeError)
    end

    it '2, should return a dish name with its price' do
      menu.create_dish(:tuna, 4.56)
      expect(dish).to receive_messages(name: nil, price: nil)
      menu.see_dishes
    end


  end
end
