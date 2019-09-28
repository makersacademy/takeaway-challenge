require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#see' do
    it 'displays a list of dishes with prices' do
      expect(menu.see).to eq Chicken: 5, Lamb: 6, Fish: 7, Vegan: 5
    end
  end

  # describe 'choose' do
  #   it 'selects some number of several available dishes' do
  #     expect(menu.choose).to eq list[:chicken], list[:fish]
  #   end
  # end

end
