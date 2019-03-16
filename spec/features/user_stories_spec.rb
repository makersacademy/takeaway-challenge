require 'menu'

RSpec.describe 'User_stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'instructs menu to show its dishes' do
    menu = Menu.new
    expect { menu.show_dishes }.not_to raise_error
  end

  it 'shows a list of dishes with prices' do
    menu = Menu.new
    expect(menu.show_dishes).to eq({dish1: 10, dish2: 11})
  end

end