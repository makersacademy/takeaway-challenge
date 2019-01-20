require 'basket'

describe Basket do
  let(:curry) { double(:dish, price: 5, formatted_display: 'Curry - £5') }

  describe '#add' do
    it 'responds to add' do
      expect(subject).to respond_to(:add).with(1).argument
    end
  end

  describe '#show' do
    it 'responds to show' do
      expect(subject).to respond_to(:show)
    end
    it 'shows the contents of the basket' do
      
    end
  end
end
