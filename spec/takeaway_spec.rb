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

  describe "#calculate_total" do
    before do
      the_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
      allow(menu).to receive_messages(restaurant_menu: the_menu)
      this_order = {"Charsui pork" => 2, "Drink" => 3}
      # => 2*5 + 3*1 = 13
    end
    it "calculates the total order cost" do
      takeaway.place_order("Charsui pork", 2)
      takeaway.place_order("Drink", 3)
      expect(takeaway.calculate_total).to eq(13)
    end
  end

end
