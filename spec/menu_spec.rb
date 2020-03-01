require 'menu'

describe Menu do

  # let(:pizza) { double :dish, name: 'pizza', price: 10.50 }
  # let(:curry) { double :dish, name: 'curry', price: 8.00 }
  # let(:burger) { double :dish, name: 'burger', price: 6.50 }

  subject(:menu) { described_class.new }
  # before { allow(subject).to receive(:create_menu).and_return([pizza, curry, burger]) }
  # [pizza, curry, burger]
  describe '.display' do
    it { is_expected.to respond_to :display }
    it 'to return an array of item number, dish name and price' do
      expect { menu.display }.to output(/pizza/).to_stdout
      expect { menu.display }.to output(/10.50/).to_stdout
    end
  end

end
