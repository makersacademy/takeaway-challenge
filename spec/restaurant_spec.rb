require 'restaurant'

describe Restaurant do
  let(:pret) { Restaurant.new }
  let(:menu) { double :menu }
  let(:item) { double :item }
  let(:name) { double :name }
  let(:other_name) { double :other_name }
  let(:price) { double :price }
  let(:description) { double :description }
  let(:phone_number) { double :phone_number }
  let(:client) { double :client }
  let(:text_message) { double :text_message }

  it { is_expected.to respond_to :restaurant_menu }

  describe '#create_menu' do
    it 'should be able to create a new menu' do
      pret.create_menu(name)
      expect(pret.restaurant_menu).not_to be_empty
    end
  end

  describe '#save_menu' do
    it 'should be able to save a new menu' do
      expect(pret.restaurant_menu).to eq []
    end
  end

  describe '#add_item_to_menu' do
    it 'should be able to add items to the menu' do
      pret.create_menu(name)
      expect(pret.add_item_to_menu(0, name, price, description)).not_to be_empty
    end
  end

  describe '#change_item' do
    it 'should be able to change items on the menu' do
      pret.create_menu(name)
      pret.add_item_to_menu(0, name, price, description)
      expect(pret.change_item(0, 0, name: other_name))
    end
  end

  describe '#delete_item_from_menu' do
    it 'should delete items from a menu' do
      pret.create_menu('brekkie')
      pret.add_item_to_menu(0, name, price, description)
      expect(pret.delete_item_from_menu(0, 0)).to eq []
    end
  end

  describe '#delete_menu' do
    it 'should be able to delete any menu' do
      pret.create_menu(name)
      expect(subject.delete_menu(name)).to eq []
    end
  end

  describe '#print_restaurant_menu' do
    it 'should print the restaurant menu' do
      pret.create_menu('brekkie')
      pret.add_item_to_menu(0, name, price, description)
      pret.add_item_to_menu(0, name, price, description)
      expect(pret.print_restaurant_menu).not_to be_empty
    end
  end

  describe '#select_item' do
    it 'should be able to select items from the menu' do
      pret.create_menu('brekkie')
      pret.add_item_to_menu(0, name, price, description)
      pret.add_item_to_menu(0, name, price, description)
      expect(pret.select_item(0, 0)).not_to be_empty
    end
  end

  describe '#remove_selected_item' do
    it 'should be able to remove selected items' do
      pret.create_menu('brekkie')
      pret.add_item_to_menu(0, name, price, description)
      pret.select_item(0, 0)
      pret.remove_selected_item(0)
      expect(pret.basket.basket_items).to eq []
    end
  end

  describe '#print_basket' do
    it 'should print the basket' do
      pret.print_basket
    end
  end

  describe '#check_out' do
    it 'should check out the order' do
      text = Restaurant.new('name', text_message )
      allow(text_message).to receive(:send_text_message)
      text.check_out(phone_number)
      expect(text_message).to have_received(:send_text_message)
      expect(pret.basket.basket_items).to be_empty
    end
  end

end
