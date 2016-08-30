require 'menu_builder'

describe MenuBuilder do
  subject(:menu) { described_class.new([["list"]]) }

  describe '#list' do
    it 'contains a list' do
      expect(menu.list).to eq [["list"]]
    end
    it 'each item has key/value pairs' do
      expect(menu.list).to all( be_an(Array) )
    end

  end
end