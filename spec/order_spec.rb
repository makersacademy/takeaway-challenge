require 'order'
require 'menu'

describe Order do

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }

    it 'accepts a dish order' do
      expect { subject.add('pizza') }.to output("1x pizza(s) has been added to your basket\n").to_stdout
    end

    it 'returns the order array of one item' do
      expect(subject.add('pizza')).to match_array([{ 'pizza' => 6.5 }])
    end
  end

end
