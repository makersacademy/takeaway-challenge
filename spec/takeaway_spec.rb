require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu_klass.new, order_klass.new) }

  let(:menu) { double(:menu, dishes: {"Spring Roll" => 0.99, "Fried Prawn" => 2.99}) }
  let(:menu_klass) { double(:menu_klass, new: menu) }

  let(:order) { double(:order) }
  let(:order_klass) { double(:order_klass, new: order) }

  context "#initialize" do

    it "creates a new #Menu instance" do
      expect(takeaway).to have_attributes(:menu => menu)
    end

    it "creates a new #Order instance" do
      expect(takeaway).to have_attributes(:order => order)
    end
  end

  context "#read_menu" do

    it "displays the menu" do
      allow(menu).to receive(:read) { menu.dishes }
      expect(takeaway.read_menu).to eq menu.dishes
    end
  end

  context "#order" do



end


end
