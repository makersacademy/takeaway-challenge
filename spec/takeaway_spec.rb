require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(dishes) }
  let(:dishes) { {onion_bhaji: 2.95, chicken_tikka_masala: 7.95, naan: 1.95} }

  describe '#dishes' do
    it 'displays a list of dishes with prices' do
      expect(takeaway.dishes).to eq dishes
    end
  end

  describe '#select_dishes' do
    it { is_expected.to respond_to(:select_dishes).with(1).argument }

    it 'returns the dishes that were selected' do
      order = {chicken_tikka_masala: 1, naan: 2}
      expect(takeaway.select_dishes(order)).to eq order
    end

    context 'when unavailable dish is selected' do
      it 'raises an error' do
        expect{ takeaway.select_dishes(bouillabaisse: 5) }.to raise_error 'Bouillabaisse is not available.'
      end
    end
  end
end