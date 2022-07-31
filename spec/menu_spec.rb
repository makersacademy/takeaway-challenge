require './lib/menu.rb'

RSpec.describe Menu do

  it 'has a list of dishes with prices' do
    new_menu = Menu.new
    expect(new_menu.menu).to eq Menu::MENU
  end

  it 'responds to the method view' do
    expect(subject).to respond_to(:view)
  end

end
