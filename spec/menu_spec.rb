require_relative "../lib/menu"

describe Menu do
  let(:menu) { Menu.new }
  # let(:dishes) { {"carbonara" => 3.20, "polpette" => 4.50} }
  # let(:order) { Menu.new.choose }

  it { is_expected.to respond_to(:view) }
  it { is_expected.to respond_to(:choose).with_unlimited_arguments }
  it { is_expected.to respond_to(:show) }

  describe "#View" do
    it "returns a list of dishes with prices" do
      @dishes = {
        "Pasta alla carbonara" => 5.60,
        "Risotto alla milanese" => 6.40,
        "Cotoletta alla milanese" => 7.10,
        "Pollo alla cacciatora" => 7.50,
        "Torta paesana" => 4.10,
        "Caffè" => 0.90
      }
      expect(menu.view).to eq @dishes
    end
  end

  describe "#Choose" do
    it "allows to select some number of several available dishes" do
      expect(menu.choose("carbonara", "carbonara", "polpette")).to include "carbonara"
    end
  end

  describe "#Show Order" do
    it "prints the order" do
      expect(menu.show).to eq @order
    end
  end

end
