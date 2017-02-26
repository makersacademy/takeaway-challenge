require 'takeaway'

describe Takeaway, :t do
  let(:menu) { double }
  subject(:takeaway) { described_class.new(menu) }
  before do
    @the_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
    allow(menu).to receive_messages(restaurant_menu: @the_menu)
  end

  describe "#show_menu" do
    it "returns the menu" do
      expect(takeaway.show_menu).to eq(@the_menu)
    end
  end

  describe "#place_order" do
    it "records the user's choices" do
      dish = "Choisum"
      portions = 3
      expect(takeaway.place_order(dish, portions)).to eq({dish => portions})
    end

    it "doesn't allow an unknown dish to be ordered" do
      message = "Item not on menu."
      expect{takeaway.place_order("Pizza")}.to raise_error(message)
    end
  end

  describe "#calculate_total" do
    it "calculates the total order cost" do
      takeaway.place_order("Charsui pork", 2)
      takeaway.place_order("Drink", 3)
      expect(takeaway.calculate_total).to eq(13)
    end
  end

end
