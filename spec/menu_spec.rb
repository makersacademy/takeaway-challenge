require 'menu'

describe Menu do

  let(:pizza) { double :dish, name: 'pizza', price: 10.50 }
  let(:curry) { double :dish, name: 'curry', price: 8.00 }
  let(:burger) { double :dish, name: 'burger', price: 6.50 }

  #subject(:menu) { described_class.new }
  #before { allow(subject).to receive(:create_menu).and_return([pizza, curry, burger]) }
  # [pizza, curry, burger]
  describe '.display' do
    it { is_expected.to respond_to :display }
    it 'to return an array of item number, dish name and price' do
      allow(subject).to receive(:create_menu).and_return([pizza, curry, burger])
      expect(subject.display).to match_array [[1, 'pizza', 10.50], [2, 'curry', 8.00], [3, 'burger', 6.50]]
    end
  end

end
