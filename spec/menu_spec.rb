require 'menu'

describe Menu do

    it 'displays a list of dishes' do
      allow(subject).to receive(:list_dishes).and_return(described_class::DISHES)

  end
end
