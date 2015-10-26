require 'take_away'

describe Takeaway do
  subject(:take_away) { described_class.new }

  context '#read_menu' do
    it { is_expected.to respond_to :read_menu }
  end

  context '#order' do
    it { is_expected.to respond_to(:order).with(1).argument }

    it 'adds menu item to my order' do
      subject.order('hotdog')
      expect(subject.my_order).to eq({ 'hotdog' => 1 })
    end

    it 'adds multiple items to my order' do
      subject.order('hotdog')
      subject.order("Fries")
      expect(subject.my_order).to eq({ 'hotdog' => 1, 'Fries' => 1 })
    end

    it 'update the quantity of item' do
      subject.order('hotdog')
      subject.order('hotdog')
      expect(subject.my_order).to eq ({'hotdog' => 2})
    end

  context '#calculate' do
    it 'calculates total value of my order' do
      subject.order('hotdog')
      expect(subject.calculate).to eq 1.99
    end

    it 'add up multiple items' do
      subject.order('hotdog')
      subject.order('hotdog')
      subject.order('cheesebuger')
      subject.order('Fries')
      subject.order('Fries')
      expect(subject.calculate).to eq 7.25
    end
  end

  context '#basket' do
    it { is_expected.to respond_to :basket }
  end
  end
end
