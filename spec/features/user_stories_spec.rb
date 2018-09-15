describe 'user_stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so user can check the menu, list dishes with prices' do
    menu = Menu.new
    expect { menu.list }.to_not raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so user can order the meal, let user select some available dishes' do
    menu = Menu.new
    order = Order.new
    expect { order.add([['egg', 12], ['pineapple', 3]], 23) }.to_not raise_error
  end
end