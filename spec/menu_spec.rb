require 'menu'

describe Menu do

    it 'displays a list of dishes' do
      allow(subject).to receive(:list_dishes).and_return(described_class::DISHES)
    end

    it 'creates an list of selected dishes' do
      expect(subject.order("pizza")).to eq [{"pizza" =>10}]
    end

end
