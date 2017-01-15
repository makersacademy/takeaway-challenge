require "array_printer"

describe ArrayPrinter do

  subject(:printer) { described_class }
  let(:menu) { instance_double("Menu") }
  let(:pepperoni) { instance_double("Dish") }
  let(:hawaiian) { instance_double("Dish") }
  let(:meat_feast) { instance_double("Dish") }
  let(:dishes) { [pepperoni, hawaiian, meat_feast] }

  describe "#list" do
    before(:each) do
      allow(menu).to receive(:dishes) { dishes }
    end
    it "creates a hash" do
      expect(printer.list(menu)).to be_a(Hash)
    end
    it "places dish objects in hash with keys 1..n" do
      expect(printer.list(menu)).to include(1 => pepperoni, 2 => hawaiian, 3 => meat_feast)
    end
  end

end
