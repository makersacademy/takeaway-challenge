require 'menu'

describe Menu do

  subject(:menu){described_class.new}

  it 'should give user a list of menu dishes' do
    expect(subject.menu_dishes).to eq Menu::MENU_LIST
  end

  it 'should add selected items to selected list' do
    order_choice = {:food => 6}
    subject.order(:food, 6)
    expect(subject.order_choice).to eq order_choice
  end
end
