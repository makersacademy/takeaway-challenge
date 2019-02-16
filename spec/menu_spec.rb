require './lib/menu.rb'

describe Menu do
  let(:dish_double) { double :dish }
  let(:dish_class) { double :dish_class, new: dish_double }
  before :each do
    @menu = Menu.new(dish_class)
  end
  it 'is created with a dishs array' do
    expect(@menu.dishes).to include dish_double
  end
end
