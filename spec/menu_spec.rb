require 'menu'
require 'dish'

describe Menu do

  it 'adds a new dish to dishes array and shows dishes with prices' do
    menu = Menu.new
    menu.make_dish("sushi", Menu::DEFAULT_PRICE)
    menu.add_dish
    menu.make_dish("laksa", Menu::DEFAULT_PRICE)
    menu.add_dish
    menu.make_dish("pizza", Menu::DEFAULT_PRICE)
    menu.add_dish
    expect(menu.dishes).to include({ "type" => "sushi", "price" => Menu::DEFAULT_PRICE }, { "type" => "laksa", "price" => Menu::DEFAULT_PRICE }, { "type" => "pizza", "price" => Menu::DEFAULT_PRICE })
  end

  it 'allows user to select one dish' do
    menu = Menu.new
    menu.make_dish("sushi", Menu::DEFAULT_PRICE)
    menu.add_dish
    menu.make_dish("laksa", Menu::DEFAULT_PRICE)
    menu.add_dish
    menu.make_dish("pizza", Menu::DEFAULT_PRICE)
    menu.add_dish
    expect(menu.dishes[0]).to include ({ "type" => "sushi", "price" => Menu::DEFAULT_PRICE })
  end

  it 'allows user to select some number of dishes' do
    menu = Menu.new
    choice1 = menu.make_dish("sushi", Menu::DEFAULT_PRICE)
    menu.add_dish
    choice2 = menu.make_dish("laksa", Menu::DEFAULT_PRICE)
    menu.add_dish
    choice3 = menu.make_dish("pizza", Menu::DEFAULT_PRICE)
    menu.add_dish
    menu.select_sushi
    menu.select_laksa
    expect(menu.selection).to include({ "type" => "sushi", "price" => Menu::DEFAULT_PRICE }, { "type" => "laksa", "price" => Menu::DEFAULT_PRICE })
  end

  it 'gives customer the total' do
    menu = Menu.new
    choice1 = menu.make_dish("sushi", Menu::DEFAULT_PRICE)
    menu.add_dish
    choice2 = menu.make_dish("laksa", Menu::DEFAULT_PRICE)
    menu.add_dish
    choice3 = menu.make_dish("pizza", Menu::DEFAULT_PRICE)
    menu.add_dish
    menu.select_sushi
    menu.select_laksa
    expect(menu.total).to eq 2
  end

  it 'checks total given to customer is same as sum cost of dishes selected' do
    menu = Menu.new
    choice1 = menu.make_dish("sushi", 1)
    menu.add_dish
    choice2 = menu.make_dish("laksa", 1)
    menu.add_dish
    choice3 = menu.make_dish("pizza", 1)
    menu.add_dish
    menu.select_sushi
    menu.select_laksa
    expect(menu.total_correct?).to be true
  end

  # it 'sends a confirmation message to the customer' do
  #   menu = Menu.new
  #   choice1 = menu.make_dish("sushi", 1)
  #   menu.add_dish
  #   choice2 = menu.make_dish("laksa", 1)
  #   menu.add_dish
  #   choice3 = menu.make_dish("pizza", 1)
  #   menu.add_dish
  #   menu.select_sushi
  #   menu.select_laksa
  # end
end
