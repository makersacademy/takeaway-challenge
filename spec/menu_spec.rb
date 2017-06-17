require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  it { is_expected.to be_a Menu }
  it { is_expected.to respond_to :contents }

  let(:dish_1) do
    dish_1 = double(:dish_1)
    allow(dish_1).to receive(:title) { "Chicken Burger" }
    allow(dish_1).to receive(:price) { 8.99 }
    dish_1
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
        menu.add(dish_1)
      end

      it 'has added items in the contents array' do
        expect(menu.contents).to include(dish_1)
      end
    end
  end

  describe '#view' do
    it { is_expected.to respond_to :view }
  end

  context 'Viewing menu contents' do
    before do
      menu.add(dish_1)
    end

    it 'Outputs a list of the menu\'s contents' do
      expect { menu.view }.to output("#{dish_1.title}: #{dish_1.price}\n").to_stdout
    end
  end
end
