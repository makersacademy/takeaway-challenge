require 'takeaway'
require 'menu'
require 'text'

describe 'takeaway' do
  menu = Menu.new
  eat = TakeAway.new(menu)
  it 'lets you see the menu' do
    eat.read_menu
  end
  it 'lets you add a dish to your basket' do
    eat.order('sushi')
  end
  it 'lets you view your current orders' do
    eat.basket
  end
  it 'lets you empty your basket if you made a mistake' do
    eat.empty_basket
  end
  it 'lets you add multiples of the same dish to your basket' do
    eat.order('pie', 3)
  end
  it 'lets you check your order against the total price' do
    eat.show_basket
    eat.order_total
  end
  it 'lets you complete your order and receieve a text message' do
    VCR.use_cassette('twilio') do
      eat.complete_order
    end
  end
end
