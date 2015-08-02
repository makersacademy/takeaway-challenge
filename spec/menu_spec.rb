require 'menu'

describe Dishes do
  it 'generates instances of dish' do
    Menu.new
    expect($menu.count).to be > 0
  end

  it 'can make new dish' do
    subject.new_dish :beef, 6
    expect($menu).to include(beef: 6)
  end
end
