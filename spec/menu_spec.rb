require 'menu'

describe Menu do
  let(:food1) { class_double Food, to_s: "Item #1: Nachos - £6 (Starter)", class: Food }
  let(:food2) { class_double Food, to_s: "Item #2: Pizza - £6 (Main)", class: Food }
  let(:food3) { class_double Food, to_s: "Item #3: Chips - £3 (Side)", class: Food }
  let(:food4) { class_double Food, to_s: "Item #4: Cake - £3 (Dessert)", class: Food }
  let(:drink1) { class_double Drink, to_s: "Item #5: Beer - £4 (Drink)", class: Drink }
  let(:sample_menu) { Menu.new([food1, food2, food3, food4, drink1]) }

  it "can be initialised with an array of items" do
    Menu.new([food1, food2])
  end

  describe "#display_all" do
    it "calls #to_s on every item in @items" do
      expect(food1).to receive(:to_s)
      expect(food2).to receive(:to_s)
      expect(food3).to receive(:to_s)
      expect(food4).to receive(:to_s)
      expect(drink1).to receive(:to_s)
      sample_menu.display_all
    end
  end

  describe "#display_food" do
    it "calls #to_s on every food item" do
      expect(food1).to receive(:to_s)
      expect(food2).to receive(:to_s)
      expect(food3).to receive(:to_s)
      expect(food4).to receive(:to_s)
      expect(drink1).not_to receive(:to_s)
      sample_menu.display_food
    end
  end

  describe "#display_drinks" do
    it "calls #to_s on every beverage" do
      expect(drink1).to receive(:to_s)
      expect(food1).not_to receive(:to_s)
      sample_menu.display_drinks
    end
  end

  describe "#add" do
    it "adds a received item to a menu" do
      empty_menu = Menu.new
      empty_menu.add(food1)
      expect{ empty_menu.display_all }.to output("Item #1: Nachos - £6 (Starter)\n").to_stdout
    end
  end

  describe "#select" do
    it "returns the food with a given ID" do
      skip
    end

    it "throws an error if given ID not in the menu" do
      skip
    end
  end
end