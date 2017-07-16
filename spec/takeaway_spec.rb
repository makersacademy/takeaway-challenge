require 'takeaway'

describe Takeaway do
  let(:subject) { described_class.new }
  let(:dish) { double :dish }
  let(:quantity) { 1 }

  describe '#read_menu' do
    it { is_expected.to respond_to(:read_menu) }

    it 'displays the menu' do
      expect(subject.read_menu).to eq Menu::MENU
    end
  end

  describe '#order' do

    it { is_expected.to respond_to(:order).with(2).argument }

    it 'adds an item to basket' do
      items = Hash.new(0)
      items[dish] += 1
      subject.order(dish, quantity)
      expect(subject.view_basket).to eq items
    end

  end
  describe '#view_basket' do
    it { is_expected.to respond_to(:view_basket) }

    it 'displays basket' do
      subject.order(dish, quantity)
      subject.order(dish, quantity)
      items = Hash.new(0)
      items[dish] += 2
      expect(subject.view_basket).to eq items
    end
  end
end
