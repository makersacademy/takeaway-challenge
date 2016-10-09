require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#show_menu' do
    specify { expect { menu.show_menu }.to output.to_stdout }
  end

  describe "#check_price(item)" do
    it "returns the price if the item is available" do
      expect(menu.check_price("Taco")).to eq 1.00
    end

    it "Raises an error if the item is unavailable" do
      expect{menu.check_price("Hamburger")}.to raise_error "This item is not available"
    end
end

describe "#calculate_total" do
  it "Calculates the cart total" do
    cart = {"Taco"=>1.00, "Guacamole"=>1.00}
    expect(menu.calculate_subtotal(cart)).to eq [["Taco", 1, 1.00], ["Guacamole", 1, 1.00]]
  end
end
end
