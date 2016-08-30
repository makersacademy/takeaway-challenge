require 'takeaway'

describe Menu do

subject(:menu) {described_class.new}

    describe '#add' do
      it 'should add a dish to the menu' do
        menu.add('soap', 7.0)
        expect(menu.dishes).to include('soap' => 7.0)
      end
    end

    describe '#list_menu' do
      it 'should list the menu items' do
        menu.add('soap', 7.0)
        menu.add('pizza', 2.0)
        expect(menu.list_menu).to eq menu.dishes
      end

    end

end
