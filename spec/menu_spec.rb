require './lib/menu.rb'
describe Menu do
  let(:menu) { double :menu }
  it 'shows the menu' do
    expect(subject.show_menu).to eq Menu::The_menu
  end
end
