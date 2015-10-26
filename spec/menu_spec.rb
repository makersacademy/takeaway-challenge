require './lib/menu.rb'

describe Menu do
    let(:menu) {described_class.new}

    describe "#initialization" do

    it 'is initialized with a default menu' do
      expect(subject.menu).to include {}
    end

    it 'knows the price of each with dish' do
      expect(subject.price(:Coke)).to eq (5)
    end
  end
end
