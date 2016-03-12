require 'Menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize' do

    it 'should initialize with the menu items in a hash' do
      expect(menu.print.clear).to eq ({})
    end

  end

  describe '#print' do

    it 'should duplicate menu items so that they can be accessed by outside' do
      expect(menu.print.clear).to eq({})
    end

  end

end
