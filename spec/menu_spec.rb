require 'menu'
require 'goods'

describe Menu do
  let(:food1) { double :food, to_s: "Item #1: Nachos - £6 (Starter)", class: Food, id: 1 }
  let(:food2) { double :food, to_s: "Item #2: Pizza - £6 (Main)", class: Food, id: 2 }
  let(:food3) { double :food, to_s: "Item #3: Chips - £3 (Side)", class: Food, id: 3 }
  let(:food4) { double :food, to_s: "Item #4: Cake - £3 (Dessert)", class: Food, id: 4 }
  let(:drink1) { double :drink, to_s: "Item #5: Beer - £4 (Drink)", class: Drink, id: 5 }
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
      expect { sample_menu.display_all }.to output.to_stdout
    end
  end

  describe "#display_food" do
    it "calls #to_s on every food item" do
      expect(food1).to receive(:to_s)
      expect(food2).to receive(:to_s)
      expect(food3).to receive(:to_s)
      expect(food4).to receive(:to_s)
      expect(drink1).not_to receive(:to_s)
      expect { sample_menu.display_food }.to output.to_stdout
    end
  end

  describe "#display_drinks" do
    it "calls #to_s on every beverage" do
      expect(drink1).to receive(:to_s)
      expect(food1).not_to receive(:to_s)
      expect { sample_menu.display_drinks }.to output.to_stdout
    end
  end

  describe "#add" do
    it "adds a received item to a menu" do
      empty_menu = Menu.new
      empty_menu.add(food1)
      expect { empty_menu.display_all }.to output("Item #1: Nachos - £6 (Starter)\n").to_stdout
    end
  end

  describe "#select" do
    it "throws error if food with that ID doesn't exist" do
      empty_menu = Menu.new
      expect { empty_menu.select(1) }.to raise_error("Item doesn't exist in the menu")
    end

    it "returns the food with a given ID" do
      allow(food3).to receive(:id).and_return(3)
      expect(sample_menu.select(3)).to eq(food3)
    end
  end
end
