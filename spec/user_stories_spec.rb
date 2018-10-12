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
