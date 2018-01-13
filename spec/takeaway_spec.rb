require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu) }
  let(:checkout) { double(:checkout) }

  describe '#initialize' do
    it 'initializes with a new instance of menu' do
      expect(Menu).to receive(:new).and_return(menu)
      expect(subject.menu).to eq(menu)
    end

    it 'initializes with a new instance of checkout' do
      expect(Checkout).to receive(:new).and_return(checkout)
      expect(subject.checkout).to eq(checkout)
    end
  end

end
