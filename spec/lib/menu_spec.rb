require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#list' do
    it 'contains a hash list' do
      expect(menu.list).to respond_to(:each)
    end
    it 'each item has key/value pairs' do
      expect(menu.list).to all( be_an(Array) )
    end

  end
end