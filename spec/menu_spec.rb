require 'menu'

describe Menu do
  let(:menu)   { described_class.new }

  it { is_expected.to be_a Menu }
  it { is_expected.to respond_to :contents }

  let(:menu_item_1) do
    menu_item_1 = double(:menu_item_1)
    allow(menu_item_1).to receive(:title)  { "Chicken Burger" }
    allow(menu_item_1).to receive(:price) { 8.99 }
    menu_item_1
  end

  describe 'Contents' do
    it 'is an array' do
      expect(menu.contents).to be_a Array
    end

    it 'starts off empty' do
      expect(menu.contents).to be_empty
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }

    context 'Adding an item to the menu' do
      before do
        menu.add(menu_item_1)
      end

      it 'has added items in the contents array' do
        expect(menu.contents).to include(menu_item_1)
      end
    end
  end

  describe '#view' do
    it { is_expected.to respond_to :view }
  end

  context 'Viewing menu contents' do
    before do
      menu.add(menu_item_1)
    end

    it 'Outputs a list of the menu\'s contents' do
      expect { menu.view }.to output("#{menu_item_1.title}: #{menu_item_1.price}\n").to_stdout
    end
  end
end
