require 'order'
require 'menu'

describe Order do

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }

    it 'accepts a dish order and lets you know what has been added' do
      expect { subject.add('pizza') }.to output("1x pizza(s) has been added to your basket\n").to_stdout
    end

    it 'returns the order array of one item' do
      expect(subject.add('pizza')).to match_array([{ :food => 'pizza', :price => 6.5 }])
    end
  end

  describe '#check' do
    it { is_expected.to respond_to(:check) }

    it 'shows you a 2-item order' do
      subject.add('pizza')
      subject.add('chicken')
      expect{subject.check}.to output("1x pizza\n1x chicken\n").to_stdout
    end
  end

end
