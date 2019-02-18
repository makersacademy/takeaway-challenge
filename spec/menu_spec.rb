require 'menu'
describe Menu do
  let(:double_dish) { double :dish }
  let(:another_double_dish) { double :another_dish }
  let(:basket_double) { double :basket, add_item: nil }

  it 'gets created with an empty list of dishes when list of dishes not passed in' do
    menu = Menu.new
    expect(menu.instance_variable_get(:@dishes)).to eq([])
  end

  it 'gets created with a list of dishes when list of dishes is passed in' do
    dish_list = [double_dish, another_double_dish]
    menu = Menu.new(dish_list)
    expect(menu.instance_variable_get(:@dishes)).to equal(dish_list)
  end

  it 'returns list of dishes' do
    dish_list = [double_dish, another_double_dish]
    menu = Menu.new(dish_list)
    expect(menu.dishes).not_to equal(dish_list)
    expect(menu.dishes).to eq [double_dish, another_double_dish]
  end

  it 'adds dish to dish list' do
    menu = Menu.new
    menu.add_dish(double_dish)
    expect(menu.dishes).to include(double_dish)
  end

  it 'removes dish from dish list' do
    dish_list = [double_dish, another_double_dish]
    menu = Menu.new(dish_list)
    menu.remove_dish(double_dish)
    expect(menu.dishes).not_to include(double_dish)
  end

  it 'returns the dish when it is selected from the dish list' do
    dish_list = [double_dish, another_double_dish]
    menu = Menu.new(dish_list)
    expect(menu.select_dish(double_dish)).to eq(double_dish)
  end

end
