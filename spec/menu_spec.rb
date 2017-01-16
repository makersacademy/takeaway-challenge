require 'menu'
require 'takeaway'

describe Menu do
subject(:menu) {described_class.new(dishes)}

let(:dishes) do
  {
    chicken: 3.50
  }

  it 'contains a list of food items and prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Chicken £3.99"
    expect(menu.print).to eq(print_menu)
  end
end
end
