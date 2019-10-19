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
end
