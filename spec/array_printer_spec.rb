require "array_printer"

describe ArrayPrinter do

  subject(:printer) { described_class }
  let(:menu) { instance_double("Menu") }
  let(:pepperoni) { instance_double("Dish") }
  let(:hawaiian) { instance_double("Dish") }
  let(:meat_feast) { instance_double("Dish") }
  let(:dishes) { [pepperoni, hawaiian, meat_feast] }

  describe "#print" do
    before(:each) do
      allow(menu).to receive(:dishes) { dishes }
      allow(pepperoni).to receive(:price) { 5 }
      allow(hawaiian).to receive(:price) { 10 }
      allow(meat_feast).to receive(:price) { 15 }
      allow(pepperoni).to receive(:name) { "Pepperoni Pizza" }
      allow(hawaiian).to receive(:name) { "Hawaiian Pizza" }
      allow(meat_feast).to receive(:name) { "Meat Feast Pizza" }
    end
    it "creates a string" do
      expect{printer.print_array(menu.dishes)}.to output.to_stdout
    end
    it "places array items in string listed 1..n" do
      expect{printer.print_array(menu.dishes)}.to output("1. #{pepperoni.name} #{pepperoni.price}\n2. #{hawaiian.name} #{hawaiian.price}\n3. #{meat_feast.name} #{meat_feast.price}").to_stdout
    end
  end

end
