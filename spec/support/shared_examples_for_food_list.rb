require 'food_list'

shared_examples_for FoodList do
  let(:subject) { described_class }

  it 'can be initialized with a list of items' do
    menu_items_double = double("Menu items")
    my_menu = subject.new(menu_items_double)

    expect(my_menu.items).to eq(menu_items_double)
  end

  it 'can print the list of items stored' do
    menu_item_double_1 =
      double('menu_item_double_1', formatted: "Soup: £1.20")
    menu_item_double_2 =
        double('menu_item_double_2', formatted: "Goulash: £3.20")

    my_menu = subject.new([menu_item_double_1, menu_item_double_2])

    expect(my_menu.view_items).to eq("Soup: £1.20 Goulash: £3.20 ")
  end

  it 'can load a csv file of items' do
    my_menu = subject.new

    my_menu.load_items("./spec/resources/chinese_menu.csv")

    expect(my_menu.view_items).to eq("Rice: £2.00 Chow Mein: £4.30 Pork Balls: £5.00 ")
  end
end
