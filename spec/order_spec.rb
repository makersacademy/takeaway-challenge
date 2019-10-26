require 'order'

describe Order do
  it 'can select a dish from the menu' do
    menu = Menu.new
    order = Order.new(menu)
    order.select_dish('Pizza')
    expect { order.view_selected_dishes }.to output("Pizza\n").to_stdout
  end

  it 'can select 3 dishes from the menu' do
    menu = Menu.new
    order = Order.new(menu)
    order.select_dish('Pizza')
    order.select_dish('Chips')
    order.select_dish('Coke')
    expect { order.view_selected_dishes }.to output("Pizza\nChips\nCoke\n").to_stdout
  end

  it 'shows the selected dishes, their quantities and total cost when placing an order' do
    menu = Menu.new
    order = Order.new(menu)
    order.select_dish('Pizza')
    order.select_dish('Pizza')
    order.select_dish('Chips')
    order.select_dish('Chips')
    expect { order.place_order }.to output("Pizza x 2\nChips x 2\nTotal Cost - £24").to_stdout
  end
end
