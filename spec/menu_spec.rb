require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#see' do
    it 'displays a list of dishes with prices' do
      expect(menu.see).to eq "Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5
    end
  end

  describe 'choose' do
    it 'selects some number of several available dishes' do
      expect(menu.choose("Chicken", "Fish")).to eq ["Chicken", "Fish"]
    end
  end

end
