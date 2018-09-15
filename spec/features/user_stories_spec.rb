describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'see the dishes on the menu' do
    menu = Menu.new
    expect { menu.dishes }.not_to raise_error
  end
end
