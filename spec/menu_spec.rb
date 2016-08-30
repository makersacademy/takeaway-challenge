require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#list' do

    it 'should list the dishes available' do
      expect(menu.list).to eq '1 : Won Ton Soup = 8
2 : Chilli Chicken = 6
3 : Egg Rolls = 5
4 : Fried Rice = 3
5 : Prawn Crackers = 1
'
    end

  end

end