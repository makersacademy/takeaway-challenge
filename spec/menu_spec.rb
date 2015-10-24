require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'contains a list of items' do
      expect(menu).to respond_to(:items)
    end
  end

end
