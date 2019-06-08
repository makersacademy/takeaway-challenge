require 'menu'
require 'order'

describe 'Takeaway challenge' do
  it 'selects a number of several items from the menu' do 
     
  expect(menu.print_menu).to eq([
      {
        jollof_rice: { price: 6 },
        fried_plantain: { price: 3 },
        jerk_chicken: { price: 8 },
        vegetable_patty: { price: 4.5 },
        ice_cream: { price: 4 }
      }
    ])
 
    order = Order.new
    order.add_item('jollof rice', 2)
    order.add_item('jerk chicken', 3)
    order.add_item('ice cream', 1)

    expect order.current_order to eq [
      { "jollof rice": { price: 6, quantity: 2 } },
      { "jerk chicken": { price: 8, quantity: 3 } },
      { "ice cream": { price: 4, quantity: 1 } }
    ]
  end
end
