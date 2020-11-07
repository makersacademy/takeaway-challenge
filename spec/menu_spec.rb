require_relative '../lib/menu.rb'

describe Menu do
  it 'can view the menu' do
    expect(subject.menu).to eq Menu::MENU
  end
end
