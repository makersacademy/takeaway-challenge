require 'menu'

describe 'FEATURE TEST:' do
  it 'prints the menu' do
    menu = Menu.new
    menu.to_s
  end
end
