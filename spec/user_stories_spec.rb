require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe Menu do
  let(:menu) { Menu.new }
  it 'should show me a list of dishes with prices' do
    expect(menu.show).to eq "Fish and Chips: £12\nSalad: £10"
  end
end
