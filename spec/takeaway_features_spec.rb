require 'menu'
require 'order'

describe 'Takeaway challenge' do
  it 'checks menu and adds items to order' do 
    order = Order.new
    order.print_menu
    order.add_item('jollof rice', 2)
    order.add_item('jerk chicken', 3)
    order.add_item('ice cream', 1)

    expect(order.print_menu).to eq({
          "jollof rice": { price: 6 },
          "fried plantain": { price: 3 },
          "jerk chicken": { price: 8 },
          "vegetable patty": { price: 4.5 },
          "ice cream": { price: 4 }
        })    

    expect(order.current_order).to eq ([
      { "jollof rice": { price: 6, quantity: 2 } },
      { "jerk chicken": { price: 8, quantity: 3 } },
      { "ice cream": { price: 4, quantity: 1 } }
    ])
  end
end
