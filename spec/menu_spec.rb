require './lib/menu'
require './lib/takeaway'

describe Menu do

  describe '#menu' do
    it 'gives a list of items on menu including price' do
      expect(subject.menu).to include 'Burger'
    end
  end
end
