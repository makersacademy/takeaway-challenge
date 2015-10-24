require './lib/menu.rb'

describe Menu do
  context 'checking the functionality of the menu hash array' do

    it {is_expected.to(respond_to(:menu_list))}
    it 'returns a menu item' do
      subject.menu_list
      expect(subject.menu[:hawaiian]).to eq 7
    end

    describe '#menu_list' do
      it '#menu_list will show the menu' do
      expect(subject.menu_list).to include(:hawaiian)
      end
    end

  end

end
