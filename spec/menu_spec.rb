require 'Menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#show_menu' do
    it "Should show the menu" do
      expect(menu.show_menu).to respond_to :menu
    end
  end

  describe "#check_price(item)" do
    it "Returns the price if the item is available" do
      expect(menu.check_price("Taco")).to eq 1.00
    end

    it "Raises an error if the item is unavailable" do
      expect{menu.check_price("Hamburger")}.to raise_error "This item is not available"
    end
  end

  describe "#calculate_subtotal(basket)" do
    it "Calculates the basket total" do
      basket = {"Taco"=>1.00, "Guacamole"=>1.00}
      expect(menu.calculate_subtotal(basket)).to eq [["Taco", 1, 1.00], ["Guacamole", 1, 1.00]]
    end
  end
end
