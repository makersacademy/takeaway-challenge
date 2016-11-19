require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:item) {double :item}

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
      allow(item).to receive(:to_sym)
    end
    it 'should respond to add_to_basket' do
      expect(menu).to respond_to(:add_to_basket).with(1).argument
    end
    it 'should add an item to the basket' do
        menu.add_to_basket(item)
        expect(menu.basket).to include(item)
    end
  end

end
