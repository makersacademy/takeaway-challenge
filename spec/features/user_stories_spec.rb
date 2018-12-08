
describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so that i can place an order, instruct menu to show me a list of options' do
    takeaway = Takeaway.new
    menu = Menu.new
    expect { takeaway.display(menu) }.not_to raise_error
  end
end
