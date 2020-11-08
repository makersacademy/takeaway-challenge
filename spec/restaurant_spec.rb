require 'restaurant'

RSpec.describe Restaurant do

  let(:food_menu) { double :Menu }
  subject(:restaurant) { described_class.new(food_menu) }

  it "is called on an instance of the Restaurant class" do
    expect(restaurant).to be_instance_of(Restaurant)
  end

  describe "#initialize" do
    it "creates a menu instance variable" do
      expect(restaurant.menu).to eq(food_menu)
    end
  end

  describe "#show_menu" do
    it "responds to show_menu" do
      expect(restaurant).to respond_to(:show_menu)
    end

    it "returns the menu" do
      allow(food_menu).to receive(:send).and_return({'Rainbow dumpling' => 28, 'Half crispy aromatic duck' => 39})
      expect(restaurant.show_menu).to eq(food_menu.send)
    end
  end

  describe "#check_availability" do
    it 'is called on an instance of the Restaurant class' do
      expect(restaurant).to respond_to(:check_availability).with(1).argument
    end

    it 'returns a boolean value' do
      dish = 'fish'
      allow(food_menu).to receive(:available?).with(dish).and_return(true)
      expect(restaurant.check_availability(dish)).to eq(true).or eq(false)
    end
  end
end