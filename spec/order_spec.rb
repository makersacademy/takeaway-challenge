require 'order'
require 'menu'

describe Order do

  it 'returns the total price in the basket' do
    menu = Menu.new
    menu.add_to_basket(:sushi, 1)
    expect(subject.total).to eq 8
  end

end
