require 'menu'
require 'dish'
require 'order'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#initialization' do
    it 'builds an empty menu upon initialization' do
      expect(subject.list_of_dishes.count).to eq 0
    end
  end

  describe 'filling in the menu' do
    before(:each) do
      subject.add_dish("Fries", 5)
      subject.add_dish("Pizza", 6)
      subject.add_dish("Sushi", 8)
    end

    describe '#add_dish' do
      it 'adds a dish into the menu instance variable' do
        expect(subject.list_of_dishes.count).to eq 3
      end
    end

    describe '#show_menu' do
      let(:dish) { double :dish }
      it 'shows menu when requested' do
        expect(subject.show_menu).to eq "1. Fries, £5\n2. Pizza, £6\n3. Sushi, £8"
      end
    end

    describe '#add_to_order' do
      it 'adds an item to an order' do
        subject.add_to_order(1, 3)
        expect(subject.new_order).to eq [{ :dish => "Fries", :quantity => 3, :price => 15 }]
      end
      it 'adds several items as hashes to an order' do
        subject.add_to_order(1, 3)
        subject.add_to_order(2, 1)
        subject.add_to_order(3, 1)
        expect(subject.new_order.count).to eq 3
      end
    end

    describe '#place_order' do
      let(:order) { Order.new(subject.new_order) }
      it 'places and order when finished' do
        subject.add_to_order(1, 3)
        allow(order).to receive(:current_order)
        subject.place_order
        expect(order).not_to be_nil
      end
    end
  end
end
