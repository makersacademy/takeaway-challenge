require "menu"

describe Menu do

  let(:printer_class) { double :printer_class, :format => 0 }

  describe "#food_options array" do
    it "has an array of food" do
      menu = Menu.new(printer_class)
      expect(menu.food_options).to eq([{ Dish: "Duck_Pancakes", Price: "12" },
      { Dish: "Spring_roll", Price: "8" },
      { Dish: "Noodles", Price: "5" }])
    end
  end

  describe "#print" do
    it "sends an order to print" do
      menu = Menu.new(printer_class)
      expect(menu.print).to eq(menu.printer.format(menu.food_options))
    end
  end

end
