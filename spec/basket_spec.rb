require 'basket'
require 'menu'

describe Basket do

  let(:menu) { double :menu }

  it 'puts ordered items in a basket' do
    menu = Menu.new
    menu.order('margherita')
    menu.order('pepperoni')
    expect(subject.basket).to eq ['margherita','pepperoni']
  end

  it 'allows user to check ordered items and total cost' do
    menu = Menu.new
    menu.order('margherita')
    menu.order('pepperoni')
    expect(menu.display_basket).to eq(
      "Your order:\nmargherita: £8\npepperoni: £9\nTotal: £17"
    )
  end

end
