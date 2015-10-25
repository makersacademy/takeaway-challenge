require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new }

  context "#take_away service" do

    it "shows menu when requested" do
      expect(restaurant.read_menu).to eq ["Chips - £0.89", "Chicken Tikka - £3.99", "Burger - £2.99"]
    end

    it "provides take away service" do
      is_expected.to respond_to :complete_order
    end

  end

end
