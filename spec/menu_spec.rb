require 'menu'

describe Menu do
  let(:dish) {double(:Dish)}
  let(:dish_class) {double(:Dish_class, new: dish)}
  subject(:menu) {described_class.new(dish_class)}

  before(:each) do 
    allow(dish).to receive(:name)
  end
  
  describe ' #create_dish' do 
    it '1. should create a instance of dish' do
      expect(dish_class).to receive(:new).with(instance_of(Symbol), instance_of(Float))
      menu.create_dish(:tuna, 4.56)
    end

    it '2. should create a hash where the key is the name of the dish' do
      allow(dish).to receive(:price)
      menu.create_dish(:tuna, 4.56)
      expect(menu.see_dishes).to include(:tuna)
    end

    it '3. should save a new dish in dishes hash' do
      allow(dish).to receive(:price)
      menu.create_dish(:tuna, 4.56)
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

  describe ' #place_order' do 

    before(:each) do
      allow(dish).to receive_messages(price: 4.56, total: nil)
    end

    it '1. saves a dish and its quantity' do
      menu.create_dish(:tuna, 4.56)
      menu.place_order(:tuna, 5)
      expect(menu.order).to include(dish => 5)
    end

    it '2. returns a subtotal total of the order' do
      expect(menu).to receive(:total)
      menu.place_order(:fish,2) 
    end

    it '3. it should save multiple dishes' do
      allow(menu).to receive(:total)
      menu.create_dish(:fish, 4.56)
      menu.place_order(:fish, 2)
      menu.place_order(:steak,  3)
      expect(menu.order.size).to eq(2)
    end
  end

  describe ' #subtotal' do
    it  'should return a subtotal of the order' do
      allow(menu).to receive_messages( order: {dish=>5}, dishes: {:tuna=>dish})
      allow(dish).to receive_messages(name: 'tuna', price: 4.56)
      expect(menu.total).to eq (5*4.56)
    end
  end
end
