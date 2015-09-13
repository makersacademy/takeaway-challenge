require 'menu.rb'

describe Menu do

  describe '#list' do
    it 'Should respond to menu'do
      is_expected.to respond_to(:list)
    end
    it 'should list out the menu items' do
      expect(subject.list).to eq("pizza: £5.99, burger: £4.99, chips: £2.99, sandwich: £3.99")
    end
  end
  describe '#include?'
    it 'should return boolean value' do
      expect(subject.on_menu?(:pizza)).to be true
    end
    it 'should return boolean value' do
      expect(subject.on_menu?(:carrots)).to be false
    end
end
