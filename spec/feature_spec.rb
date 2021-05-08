require 'menu'
require 'dish'

describe 'takeaway features' do
  let(:dishes) { [
    Dish.new(name: 'Vegan Mixed Grill', price: '£5.50'),
    Dish.new(name: 'Sweet Potato Fries', price: '£6.50'),
    Dish.new(name: 'Vegan Burger', price: '£7.50')
  ]
  }
  let(:menu) { Menu.new(dishes) }
  let(:order) { Order.new }

  it 'can list all dishes with their prices' do
    expect(menu.list_dishes).to eq("1. Vegan Mixed Grill - £5.50\n2. Sweet Potato Fries - £6.50\n3. Vegan Burger - £7.50") 
  end

  it 'can add dishes to order' do
    order.add_dishes_to_order(menu, 1, 2, 3)
    expect(order.check_order).to eq("Vegan Mixed Grill - £5.50\nSweet Potato Fries - £6.50\nVegan Burger - £7.50\nTOTAL: £19.50")
  end

  it 'can check the price of the order' do
  end

  it 'sends a text to confirm order submission and delivery time' do
  end
end
