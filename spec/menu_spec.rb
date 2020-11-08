require 'menu'

RSpec.describe Menu do

  subject(:food_menu) { described_class.new }

  describe "#initialize" do
    it 'creates a menu upon initialisation' do
      expect(food_menu.food_list).to eq({'Rainbow dumpling' => 28, 'Half crispy aromatic duck' => 39})
    end
  end

  describe "#send" do
    it 'returns the menu' do
      expect(food_menu.send).to eq(food_menu.food_list)
    end
  end

  describe "#available?" do
    it "is called on an instance of the Menu class" do
      expect(food_menu).to respond_to(:available?).with(1).argument
    end

    it 'returns a boolean value' do
      dish = 'fish'
      expect(food_menu.available?(dish)).to eq(true).or eq(false)
    end
  end

end