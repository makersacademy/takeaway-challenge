
RSpec.describe 'User stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'So user can see a list of dishes, all dishes have prices and can be viewed' do
    menu = Menu.new
    expect { menu.view }.not_to raise_error
  end

end
