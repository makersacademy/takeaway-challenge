require 'menu'
# Show a list of dishes and prices
# # when we create Menu object, we want to Menu object to pass into Dishes to make up the Menu

describe Menu do

  subject(:menu) { described_class.new(dishes) }# we can get dishes inside of menu with DEPENDENCY INJECTION
  let(:dishes) do
    {              #we need Hash because we want to change Menu and it's easier with Hashes
      chicken: 3.99,
      falafel: 4.50
    }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'prints a list of dishes with prices' do
    printed_menu = 'Chicken £3.99, Falafel £4.50'
    expect(menu.print).to eq(printed_menu)
  end
end
