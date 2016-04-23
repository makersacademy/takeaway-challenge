require 'menu'

describe Menu do
  let(:dish_class) { double(:dish_class) }

  describe '#initialize' do
    subject(:menu_class) { described_class }
    it "is initialized with 1 argument" do
      expect(menu_class.new(dish_class)).to be_a menu_class
    end
    it "has an optional argument" do
      expect(menu_class.new).to be_a menu_class
    end
  end
end
