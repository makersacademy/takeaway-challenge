require 'menu'

describe Menu do

  subject(:menu){described_class.new}

  it 'should give user a list of menu dishes' do
    expect(subject.menu_dishes).to eq Menu::MENU_LIST
  end

  it 'should add selected items to selected list' do
  end
end
