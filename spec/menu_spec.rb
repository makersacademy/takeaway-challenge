require 'menu'
describe Menu do
  it 'gets created with an empty list of dishes when list of dishes not passed in' do
    menu = Menu.new
    expect(menu.instance_variable_get(:@dishes)).to eq []
  end

  it 'gets created with a list of dishes when list of dishes is passed in' do
    double_dish = double :dish
    another_double_dish = double :another_dish
    dish_list = [double_dish, another_double_dish]
    menu = Menu.new(dish_list)
    expect(menu.instance_variable_get(:@dishes)).to equal dish_list
  end
end
