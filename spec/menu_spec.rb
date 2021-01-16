require 'menu'

describe Menu do

    it 'displays a list of dishes' do
      expect(subject.list_dishes).to eq(described_class::DISHES)
    end

end
