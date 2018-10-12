require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe Menu do
  let(:menu) { Menu.new }
  let(:items) { "Margherita: £8\nRoasted Vegetable: 9\nChorizo: £12" }

  it 'should show me a list of dishes with prices' do
    expect(menu.show(items)).to eq items
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
describe Order do
  let(:order) { Order.new }
  let(:items) { ["Margherita", "Chorizo"] }

  it 'should allow me to choose some of the dishes' do
    expect(order.choose(items)).to eq "Great, you have selected Margherita and Chorizo"
  end
end
