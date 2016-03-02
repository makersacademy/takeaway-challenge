require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#initialize' do

    it 'initializes with a hash' do
      expect(subject.menu_list).to be_a Hash
    end

    it 'initializes with a hash of items' do
      expect(subject.menu_list).not_to be_empty
    end

  end

  describe '#list' do
    it 'returns a list of items and prices' do
      expect(subject.list).to eq subject.menu_list
    end

  end

  

end
