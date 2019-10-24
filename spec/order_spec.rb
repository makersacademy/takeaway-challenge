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

  it 'can can verify the total order cost is correct' do
    menu = Menu.new
    order = Order.new(menu)
    order.select_dish('Pizza')
    order.select_dish('Chips')
    order.select_dish('Coke')
    order.log_dishes_cost
    expect { order.total_order_cost }.to output("£14").to_stdout
  end

  it 'shows the selected dishes and their quantities when placing an order' do
    menu = Menu.new
    order = Order.new(menu)
    order.select_dish('Pizza')
    order.select_dish('Chips')
    order.select_dish('Coke')
    expect { order.place_order }.to output("Pizza x 1\nChips x 1\nCoke x 1\n").to_stdout
  end


end
