require 'order'

describe Order do
  it 'can select a dish from the menu' do
    menu = Menu.new
    order = Order.new(menu)
    order.select_dish('Pizza')
    expect { order.view_selected_dishes }.to output('Pizza').to_stdout
  end
end
