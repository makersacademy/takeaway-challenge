require_relative "../lib/menu.rb"

RSpec.describe Menu do
  describe "#check_menu" do
    let(:customer_order) { [:avocado_maki, :katsu_curry, :miso_soup] }
    it "returns a hash with list of dishes & prices" do
      expect(subject.check_menu).to eq subject.menu
    end
  end

  describe "#price" do
    it "returns the price of a dish" do
      expect(subject.price([:avocado_maki])).to eq 4
    end

    it "returns the price of an array of dishes" do
      expect(subject.price([:avocado_maki, :katsu_curry, :miso_soup])).to eq 16
    end
  end
end
