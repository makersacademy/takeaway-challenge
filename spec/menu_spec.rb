require 'menu'

describe Menu do

  subject(:menu){ described_class.new}

  describe '#show_menu' do
    it 'should give a list of available pizzas' do
    expect(subject.show_menu).to eq Menu::DISHES
    end
  end

end
