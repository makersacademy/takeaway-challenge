require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  it { is_expected.to be_a Menu }
  it { is_expected.to respond_to :contents }

  let(:dish_1) do
    dish_1 = double(:dish_1)
    allow(dish_1).to receive(:title) { "Horse Burger" }
    allow(dish_1).to receive(:price) { 8.99 }
    dish_1
  end

  describe 'Contents' do
    it 'is a hash' do
      expect(menu.contents).to be_a Hash
    end

    it 'has meals when initialized' do
      expect(menu.contents).to include("Horse Burger" => 8.99)
    end
  end

  describe '#view' do
    it { is_expected.to respond_to :view }

    it 'Outputs a list of the menu\'s contents' do
      expect { menu.view }.to output(/#{dish_1.title}: #{dish_1.price}/).to_stdout
    end
  end
end
