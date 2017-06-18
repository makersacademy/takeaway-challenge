require './docs/menu.rb'

describe Menu do

let(:menu) { described_class.new }

  describe "#initialize" do
    it 'starts with list of dishes' do
      expect(menu.dishes).not_to be_empty
    end
  end

  describe '#display_menu' do
    it 'should display formatted menu' do
      expect(menu.display_menu).to include ("chilli chicken ramen")
    end
  end

  describe "#find_price" do
    it "returns the price of an item" do
      expect(menu.find_price("warm tofu chilli salad")).to eq(11.0)
    end
  end

end