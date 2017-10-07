require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#initialize' do
    
    it 'has a list of menu items' do
      expect(menu.items).to be_an_instance_of Hash
    end

  end

  describe '#print' do
    
    it 'prints the menu as a string' do
      expect(menu.items).to receive(:each)
      menu.print
    end

  end

end
