require './lib/menu'
require './lib/dish'

describe Menu do
let(:dish_klass1) {Dish}
subject {Menu.new dish_klass1}



  it 'injects a depnedancy of dish' do
    expect(subject.dish_klass).to eq dish_klass1
  end

  describe 'crud menu' do
    context 'when creating a menu item' do
      it '#add_dish name' do
        subject.add_dish 'Standard Pizza',4.99
        expect(subject.menu.last.name).to eq 'Standard Pizza'
      end
      it '#add_dish price' do
        subject.add_dish 'Standard Pizza',4.99
        expect(subject.menu.last.price).to eq 4.99
      end
      it '#add_dish menu_id' do
        subject.add_dish 'Standard Pizza',4.99
        expect(subject.menu.last.menu_id).to eq 1
      end
      it '#add_dish add second item' do
        subject.add_dish 'Standard Pizza',4.99
        subject.add_dish 'Hamburger',2.99
        expect(subject.menu.last.price).to eq 2.99
      end
    end
    context 'when reading a menu item' do
      it '#add_dish name' do
        subject.add_dish 'Standard Pizza',4.99
        expect(subject.read(1).name).to eq 'Standard Pizza'
      end
      it '#add_dish price' do
        subject.add_dish 'Standard Pizza',4.99
        expect(subject.read(1).price).to eq 4.99
      end
      it '#add_dish menu_id' do
        subject.add_dish 'Standard Pizza',4.99
        expect(subject.read(1).menu_id).to eq 1
      end
      it '#add_dish add second item' do
        subject.add_dish 'Standard Pizza',4.99
        subject.add_dish 'Hamburger',2.99
        expect(subject.read(2).price).to eq 2.99
      end
    end
    context 'when updating a menu item' do
    end
    context 'when deleting a menu item' do
    end
  end

  describe 'print menu' do
    context 'when list of items in menu_id order' do
      it '#print_dishes' do
        subject.add_dish 'Standard Pizza',4.99
        subject.add_dish 'Hamburger',2.99
        print_of_menu = "1. Standard Pizza (£4.99)\n2. Hamburger (£2.99)\n"
        expect(subject.print_dishes).to eq print_of_menu
      end
    end
  end


end