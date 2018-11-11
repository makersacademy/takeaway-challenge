require 'menu'

describe Menu do

  it 'stores a menu' do
    expect(subject.display_menu).to eq Menu::DISH_LIST
  end

end
