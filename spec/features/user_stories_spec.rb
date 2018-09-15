describe 'user_stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so user can check the menu, list dishes with prices' do
    menu = Menu.new
    expect { menu.list }.to_not raise_error
  end
end