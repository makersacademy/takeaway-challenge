require 'menu'

describe Menu do

  subject(:menu){ described_class.new}

  it 'should give a loist of available pizzas' do
    expect(subject.show_menu).to eq Menu::DISHES
  end

end
