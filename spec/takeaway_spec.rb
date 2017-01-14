require "takeaway"

describe Takeaway do

  let(:menu) { instance_double("Menu") }
  let(:pepperoni) { instance_double("Dish") }
  let(:hawaiian) { instance_double("Dish") }
  let(:meat_feast) { instance_double("Dish") }
  let(:dishes) { [pepperoni, hawaiian, meat_feast] }
  let(:menu_lister) { MenuLister }

  subject(:takeaway) { described_class.new(menu, menu_lister) }

  describe "#initialize" do
    it { is_expected.to respond_to(:menu) }
  end

  describe "#show_menu" do
    it { is_expected.to respond_to(:show_menu) }
    it "prints a hash list of the dishes in the menu" do
      allow(menu).to receive(:dishes) { [pepperoni, hawaiian, meat_feast] }
      expect{takeaway.show_menu}.to output({1 => pepperoni, 2 => hawaiian, 3 => meat_feast}.to_s).to_stdout
    end
  end

  describe "#place_order" do
    it { is_expected.to respond_to(:place_order) }
  end

end
