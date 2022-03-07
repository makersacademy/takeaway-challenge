require 'menu.rb'

describe do

  # let(:dish_double) { double :dish_double, :name => 'burger', :price => 6 }

  # it 'should have a dishes variable' do
  #   menu = Menu.new
  #   expect(menu.dishes).to(eq([]))
  # end

  # it 'should be able to add a new dish to the menu'do
  # menu = Menu.new
  # allow(Dish).to(receive(:new).and_return(dish_double))
  # menu.add_dish('burger', 6)
  # expect(menu.dishes).to_not(eq([]))
  # end

  it 'should return a list of dishes with prices' do
    menu = Menu.new
    expect(menu.list_dishes).to_not(eq(nil))
  end
end
