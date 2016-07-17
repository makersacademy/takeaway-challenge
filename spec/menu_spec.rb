require 'menu'

describe Menu do

  subject { described_class.new('lib/menu.txt') }

  describe '#show_menu' do
    it 'has a list of dishes available' do
      expect(subject.show_menu).to_not be_empty
    end

    it 'contains a list of Dish class instances' do
      expect(subject.show_menu.sample).to be_a(Dish)
    end
  end

  describe 'Basket' do
    let(:item1) { double("item1",
                         is_a?: Dish,
                         name: "Fries",
                         price: 1.49) }
    let(:item2) { double("item2",
                         is_a?: Dish,
                         name: "Cheeseburger",
                         price: 0.99) }
    let(:item3) { double("item3",
                         is_a?: Dish,
                         name: "Non-existant",
                         price: 99.99) }
    let(:menu) { [item1, item2] }

    it 'exists' do
      expect(subject.basket).to eq []
    end

    context '#add_item' do

      before do
        allow(subject).to receive(:show_menu) { menu }
      end
      it 'allows the user to add a dish to the basket' do
        subject.add_item(item1)
        expect(subject.basket).to include item1
      end

      it 'does not allow to add items which do not exist in the menu' do
        message = "This dish does not exist in the menu!"
        expect{ subject.add_item(item3) }.to raise_error message
      end

      it 'allows adding multiples of the same item' do
        subject.add_item(item1)
        subject.add_item(item1)
        expect(subject.basket.count).to eq 2
      end

    end

    context '#remove_item' do

      before do
        allow(subject).to receive(:show_menu) { menu }
        subject.add_item(item1)
        subject.add_item(item2)
        subject.add_item(item1)
      end
      it 'allows the user to remove a dish from the basket' do
        subject.remove_item(item2)
        expect(subject.basket).to_not include item2
      end

      it 'does not allow to remove items which do not exist in the basket' do
        message = "This dish does not exist in your basket!"
        expect{ subject.remove_item(item3) }.to raise_error message
      end

      it 'removes only one dish if several of a kind exist in the basket' do
        subject.remove_item(item1)
        expect(subject.basket.count).to eq 2
      end

    end

  end

end
