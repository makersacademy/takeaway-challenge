require 'order'

describe Order do

  let(:fake_menu){ double :fake_menu, list_dishes: "the menu is empty?"}
  # let(:add_dish){ double :add_dish, dish: dish, quantity: quantity}

  describe '#initialize' do
    it 'creates a empty order' do
      expect(subject.items).to eq ({})
    end
  end

  describe '#show_menu' do
    it 'prints the menu' do
      allow(subject.show_menu).to receive(fake_menu.list_dishes).and_return(fake_menu.list_dishes)
    end
  end

  describe '#add_item' do
    it 'adds menu item to the order list' do
      subject.add_dish(:cake, 5)
      expect(subject.items[:cake]).to eq(5)
    end
  end

  describe '#view_basket' do
    it 'print the complete order' do
      subject.add_dish(:cake, 1)
      expect(subject.view_basket).to eq(subject.items)
    end
  end

  describe '#checkout' do
    it 'checks if total is correct' do
      subject.add_dish(:icecream, 2)
      subject.add_dish(:cake, 3)
      expect(subject.checkout).to eq(total)
    end
  end
end
