require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:incorrect_item) {double :incorrect_item}

  context "menu items" do
    it 'should initialize with a list hash' do
      expect(menu.list).to be_instance_of Hash
    end
    it 'should have a list of foods' do
      expect(menu.list).to include(:toast)
    end
  end

  describe "#add_to_basket" do
    before do
      allow(incorrect_item).to receive(:to_sym)
    end
    it 'should respond to add_to_basket' do
      expect(menu).to respond_to(:add_to_basket).with(1).argument
    end
    it 'should add an item to the basket' do
        menu.add_to_basket(:bacon_sandwich)
        expect(menu.basket).to include(:bacon_sandwich)
    end
    it 'should not allow items to be added that are not on the menu' do
      expect{menu.add_to_basket(incorrect_item)}.to raise_error("Item not on the menu")
    end
  end

end
