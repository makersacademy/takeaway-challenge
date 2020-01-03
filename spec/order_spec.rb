require 'order'

describe Order do

  let(:menu) { double :menu, price: 1, contains?: true }

  describe '#add' do
    it { is_expected .to respond_to(:add).with(3).argument }

    it 'increases total amount by price * qty' do
      subject.add('Hummus', 1, 2)
      expect(subject.total).to eq 2
    end
  end

  
end
