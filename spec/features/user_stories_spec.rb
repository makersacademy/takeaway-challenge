
describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so that orders can be placed, take an order from the menu' do
    menu = Menu.new
    expect { menu.read }.not_to raise_error
  end
end
