require './lib/menu'

describe Menu do
  describe '#initialize' do
    it 'initialize with the menu' do
      expect(subject.menu).to include(:dish => 'Beef burger', :price => 12)
    end
  end


end