require 'confirmation'

describe Confirmation do

  let(:confirmation)  { described_class.new(given_total, correct_total) }
  let(:correct_total) { 5 }
  let(:given_total)   { 6 }

  describe '#initialize' do
    it 'initializes with the correct total' do
      expect(confirmation.correct_total).to eq 5
    end
    it 'initializes with the given total' do
      expect(confirmation.given_total).to eq 6
    end
  end

  context 'when the totals match' do
    let(:confirmation)  { described_class.new(given_total, correct_total) }
    let(:correct_total) { 5 }
    let(:given_total)   { 5 }

    describe '#correct?' do
      it 'returns true if the totals match' do
        expect(confirmation).to be_correct
      end
    end

    xdescribe '#place_order' do
      it 'sends a message' do
        expect(confirmation.place_order).to eq 'Message sent'
      end
    end

  end

  context 'when the totals do not match' do
    let(:confirmation)  { described_class.new(given_total, correct_total) }
    let(:correct_total) { 5 }
    let(:given_total)   { 6 }

    describe '#correct?' do
      it 'returns false if the totals do not match' do
        expect(confirmation).not_to be_correct
      end
    end

    describe '#place_order' do
      it 'raises an error' do
        expect { confirmation.place_order }.to raise_error 'Incorrect total'
      end
    end

  end

end
