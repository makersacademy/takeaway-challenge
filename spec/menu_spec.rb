require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'stores a list of dishes' do
    expect(menu.dishes).to eq ({"pizza" => 5, "coke" => 1})
  end

  it 'can print the dishes' do
    expect(puts menu).to eq (nil)
  end
end


require './lib/menu.rb'
menu = Menu.new
