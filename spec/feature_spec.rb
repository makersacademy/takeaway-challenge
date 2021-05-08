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

  it 'can list all dishes with their prices' do
    expect(menu.list_dishes).to eq("1. Vegan Mixed Grill - £5.50\n2. Sweet Potato Fries - £6.50\n3. Vegan Burger - £7.50") 
  end

  it 'can add items to order' do
  end

  it 'can check the price of the order' do
  end

  it 'sends a text to confirm order submission and delivery time' do
  end
end
