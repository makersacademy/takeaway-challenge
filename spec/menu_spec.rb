require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#see' do
    it 'displays a list of dishes with prices' do
      expect(menu.see).to eq "Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5
    end
  end
end
