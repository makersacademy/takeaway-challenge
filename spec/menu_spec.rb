require 'menu'

describe Menu do

  it {is_expected.to respond_to(:read_menu)}

  it 'shows the menu' do
    expect(subject.read_menu).to eq(Menu::MENU)
  end
  
end