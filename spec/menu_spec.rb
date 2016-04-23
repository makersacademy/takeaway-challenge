require 'menu'
require 'dish'

describe Menu do 
  subject(:menu) { described_class.new(dish) }
  let(:dish) { Dish.new(name: "Pizza", price: 7.99) }

  it 'prints a list of dishes with prices' do
    expect(menu.print_menu).to eq "Pizza: £7.99"
  end

end