require 'order'
require 'menu'

RSpec.describe Order do

  describe '#add' do
    it { is_expected.to respond_to(:add).with(2).arguments }

    it 'accepts a dish order and lets you know what has been added' do
      expect { subject.add('pizza', 1) }.to output("1x pizza(s) has been added to your basket\n").to_stdout
    end

    it 'returns the order array of one item' do
      expect(subject.add('pizza', 1)).to match_array([{ :food => 'pizza', :price => 6.5 }])
    end

    it ' returns the order array of 3 items' do
      subject.add('rice side dish', 2)
      expect(subject.add('beef', 1)).to match_array([{ :food => 'rice side dish', :price => 1.5 }, { :food => 'rice side dish', :price => 1.5 }, { :food => 'beef', :price => 5.5 }])
    end
  end

  describe '#check_dishes' do
    it { is_expected.to respond_to(:check_dishes) }

    it 'shows you a 2-item order' do
      subject.add('pizza', 1)
      subject.add('chicken', 1)
      expect { subject.check_dishes }.to output("1x pizza\n1x chicken\n").to_stdout
    end

    it 'shows you a 3-item order, repeating one' do
      subject.add('vegetarian', 2)
      subject.add('beef', 1)
      expect { subject.check_dishes }.to output("1x vegetarian\n1x vegetarian\n1x beef\n").to_stdout
    end
  end

  describe '#check_total' do
    it { is_expected.to respond_to(:check_total) }

    it 'calculates the total price' do
      subject.add('risotto', 1)
      subject.add('vegetarian', 1)
      expect(subject.check_total).to eq 10
    end
  end

end
