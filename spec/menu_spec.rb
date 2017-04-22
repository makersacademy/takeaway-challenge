require 'menu'

describe Menu do

  describe 'initialization' do
    it 'has a list of dishes stored in a hash' do
      expect(subject.dishes).to eq described_class::DISHES
    end
  end
end
