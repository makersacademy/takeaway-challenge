require 'menu'

RSpec.describe Menu do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
it 'shows a list of dishes with prices' do
    menu = Menu.new
    expect { menu.show_dishes }.not_to raise_error
  end

end