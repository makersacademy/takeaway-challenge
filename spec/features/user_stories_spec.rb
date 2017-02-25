describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customer can check menu, menu diplays list of dishes with prices' do
    customer = Customer.new
    menu = Menu.new
    expect { customer.display_menu(menu) }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
end
