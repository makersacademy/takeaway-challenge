require 'basket'

describe Basket do
  let(:burrito) { double :burrito, keys: ["burrito"] }

  context 'with items in it' do
    before do
      subject.items.push(burrito)
      subject.items.push(burrito)
      subject.items.push(burrito)
      subject.items.push(burrito)
    end

    it 'creates a unique list of the items in the basket' do
      expect(subject.unique_items).to eq [burrito]
    end

  end
end
