require 'menu'
require 'order'

describe Menu do

  it 'can receive order' do
    menu = Menu.new
  end

  it 'can display menu' do
    menu = Menu.new
    expect(menu).to receive([[sushi, 1.99], [sashimi, 4.50]])
  end
end

