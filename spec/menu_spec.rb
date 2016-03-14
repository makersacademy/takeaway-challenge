require 'menu'

describe Menu do
  let(:dish) {double(:Dish, name: nil)}
  let(:dish_class) {double(:Dish_class, new: dish)}
  subject(:menu) {described_class.new(dish_class)}

  before(:each) do
  allow(dish).to receive(:price)
  end 
  
  describe ' #create_dish' do 

    before(:each) do 
      menu.create_dish(:tuna, 4.56)
    end


    it '1. should create a instance of dish' do
      expect(dish_class).to have_received(:new).with(instance_of(Symbol), instance_of(Float))
    end

    it '2. should create a hash where the key is the name of the dish' do
      expect(menu.see_dishes).to include(:tuna)
    end

    it '3. should save a new dish in dishes hash' do
      allow(dish).to receive(:price)
      expect(menu.see_dishes).to include(:tuna => dish)
    end
  end

  describe ' #see_dishes'  do
    
    it '1. should raise error if there are no dishes' do
      expect{menu.see_dishes}.to raise_error(RuntimeError)
    end

    it '2. should return a dish name with its price' do
      menu.create_dish(:tuna, 4.56)
      expect(dish).to receive_messages(name: nil, price: nil)
      menu.see_dishes
    end
  end

  describe ' #dish_price' do 

    it '1. returns a dish price' do
      allow(dish).to receive(:price).and_return(4.56)
      menu.create_dish(:tuna, 4.56)
      expect(menu.dish_price(:tuna)).to eq 4.56
    end
  end


  describe '#delete dish' do
    it 'should delete a dish' do
      menu.create_dish(:steak, 7.56)
      menu.create_dish(:tuna, 4.56)
      menu.delete_dish(:steak)
      expect(menu.see_dishes).to_not include(:steak)
    end
  end
end
