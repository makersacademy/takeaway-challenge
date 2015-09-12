require 'menu.rb'

describe Menu do
  subject {described_class.new({pizza: 5.99, burger:4.99})}

  describe '#list_menu' do
    it 'Should respond to menu'do
      is_expected.to respond_to(:list_menu)
    end
    it 'should list out the menu items' do
      expect(subject.list_menu).to eq("pizza: £5.99, burger: £4.99")
    end
  end
end
