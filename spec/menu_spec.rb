require 'menu'

describe Menu do

  it {is_expected.to respond_to(:read)}

  it 'shows the menu' do
    expect(subject.read).to eq(Menu::MENU)
  end

end