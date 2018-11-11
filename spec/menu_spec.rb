require 'menu'

describe Menu do

  it 'takes a menu as an argument' do
    expect(subject.display_menu).to eq Menu::DISH_LIST
  end

end
