require 'menu'

describe Menu do 
  subject(:menu) { described_class.new(dish) }
  let(:dish) { double :dish, name: "Pizza", price: 7.99, quantity: nil }

  it 'prints a list of dishes with prices' do
    expect(menu.print_menu).to include dish
  end

end