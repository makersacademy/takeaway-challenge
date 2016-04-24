require 'menu'

describe Menu do

  it {is_expected.to respond_to(:remove).with(1).argument}

  subject(:menu) {Menu.new menu_item_class}
  let(:menu_item) {double :menu_item, name: "name", price: 1}
  let(:menu_item_class) {double :menu_item_class, new: menu_item}

  describe '#list' do
    it 'starts empty' do
      expect(menu.list).to be_empty
    end

    context "after items have been added" do
      before {menu.add "name", 1}
      it "print out item name and price" do
        menu_print = "name: 1\n"
        expect(menu.list).to eq menu_print
      end
    end
  end

  describe '#add' do
    it 'creates a new menu_item' do
      expect(menu_item_class).to receive(:new).with(:name,:price)
      menu.add :name, :price
    end

    it 'returns nil' do
      expect(menu.add :name, :price).to be_nil
    end
  end

  describe '#remove' do
    it 'raises error if not on menu' do
      expect{menu.remove :name}.to raise_error{"not on menu"}
    end

    it 'removes item from list' do
      menu.add "name", 7
      menu.remove "name"
      expect(menu.list).not_to include "name"
    end

    it 'returns nil' do
      menu.add "name", 7
      expect(menu.remove "name").to be_nil
    end

  end

end
