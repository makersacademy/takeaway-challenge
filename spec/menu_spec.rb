require 'menu'
require 'takeaway'

describe Menu do
  it 'creates a new menu' do
    menu = Menu.new
    expect(menu.dish.count).to eq 5
    expect(menu.dish).to include "Steak"  
  end 
end
