require 'menu'

describe Menu do

  subject(:menu) {described_class.new('ratties_picnic.csv')}

  describe '#dishes' do
    it 'returns a hash of dishes loaded from a csv file' do
      expect(menu.dishes[1].name).to eq "Cold chicken"
    end
  end

end
