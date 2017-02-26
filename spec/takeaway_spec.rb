require 'takeaway'

describe Takeaway, :t do
  let(:menu) { double }
  subject(:takeaway) { described_class.new(menu) }

  describe "#show_menu" do
    it "returns the menu" do
      the_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
      allow(menu).to receive_messages(restaurant_menu: the_menu)
      expect(takeaway.show_menu).to eq(the_menu)
    end
  end

  describe "#place_order" do
    it "records the user's choices" do
      dish = "Choisum"
      portions = 3
      expect(takeaway.place_order(dish, portions)).to eq({dish => portions})
    end
  end

end
