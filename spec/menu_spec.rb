require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#list' do

    it 'menu object should respond to list method' do
      expect(menu).to respond_to(:list)
    end

    it 'menu should return a hash of items' do
      expect(menu.list).to be_a Hash
    end

  end

end
