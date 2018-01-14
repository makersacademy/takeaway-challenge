require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#show' do
    it 'returns a hash' do
      expect(menu.show).to be_a Array
    end
  end
end
