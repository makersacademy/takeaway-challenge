require 'takeaway'

describe Takeaway do
  let(:subject) { described_class.new }

  describe '#read_menu' do
    it { is_expected.to respond_to(:read_menu) }

    it 'displays the menu' do
      expect(subject.read_menu).to eq Menu::MENU
    end
  end

  describe '#order' do

    it { is_expected.to respond_to(:order).with(2).argument }

    it 'adds an item to basket' do
      subject.order("spring roll", 1)
      expect(subject.view_basket).to eq "spring roll x1 = £0.99. "
    end

  end
  describe '#view_basket' do
    it { is_expected.to respond_to(:view_basket) }

    it 'displays basket' do
      subject.order("spring roll", 1)
      expect(subject.view_basket).to eq "spring roll x1 = £0.99. "
    end

  end
  describe '#total' do
    it { is_expected.to respond_to(:total) }

    it 'calculates total' do
      subject.order("spring roll", 1)
      expect(subject.display_total).to eq "Total = £0.99"
    end
  end

  describe '#complete?' do
    it { is_expected.to respond_to(:complete?) }

    it 'should be true if order complete' do
      subject.complete?
      expect(subject.complete?).to eq true
    end
  end
end
