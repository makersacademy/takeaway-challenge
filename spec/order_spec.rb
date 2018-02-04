require 'order'

describe Order do

  let(:order)                      { described_class. new }
  let(:menu)                       { double "a menu" }
  let(:dish_1)                     { "Prawn Gyoza" }
  let(:quantity_1)                 { 4 }
  let(:dish_2)                     { "Chicken Gyoza" }
  let(:quantity_2)                 { 1 }
  let(:dish_not_in_menu)           { "Chips" }
  let(:dish_not_in_menu_quantity)  { 3 }

  context "when initialized" do
    it "contains an empty order basket hash" do
      expect(order.basket).to eq(Hash.new)
    end
  end

  describe "#add" do
    before(:each) do
      order.add(dish_1, quantity_1)
      order.add(dish_2, quantity_2)
    end

    it "adds selected dishes and quantities to the order basket" do
      hash = { dish_1 => quantity_1, dish_2 => quantity_2 }
      expect(order.basket).to eq(hash)
    end

    it "raises an error if customer tries to add a negative number of dishes" do
      error_message = "Please enter the correct number of dishes"
      expect { order.add(dish_1, -5) }.to raise_error(error_message)
    end

    it "raises an error when a dish not on the menu is added to the order basket" do
      error_message = "This dish is not on the menu"
      expect { order.add(dish_not_in_menu, dish_not_in_menu_quantity) }.to raise_error(error_message)
    end
  end

  describe "#remove" do
    before(:each) do
      order.add(dish_1, quantity_1)
      order.add(dish_2, quantity_2)
    end

    it "raises an error if customer tries to remove a dish not in the order" do
      error_message = "This dish is not in your order"
      expect { order.remove(dish_not_in_menu, dish_not_in_menu_quantity) }.to raise_error(error_message)
    end

    it "raises an error if customer removes quantity greater than that of order" do
      error_message = "Please enter the correct number of dishes"
      expect { order.remove(dish_1, 5) }.to raise_error(error_message)
    end

    it "raises an error if customer tries to remove a negative number of dishes" do
      error_message = "Please enter the correct number of dishes"
      expect { order.remove(dish_1, -5) }.to raise_error(error_message)
    end

    it "reduces the quantity of a particular dish from order basket" do
      expect { order.remove(dish_1, 1) }.to change { order.basket[dish_1] }.by(-1)
    end

    it "removes dish from order basket if its quantity becomes 0" do
      expect { order.remove(dish_1, quantity_1) }.to change { order.basket.length }.from(2).to(1)
    end
  end

  describe "#sub-total" do
    it "raises an error if order basket is empty" do
      no_dishes_error = "You haven't added any dishes to your order. Please add dishes"
      expect { order.sub_total }.to raise_error(no_dishes_error)
    end

    it "calculates the sub-total for each dish in order basket" do
      order.add(dish_1, quantity_1)
      order.add(dish_2, quantity_2)
      sub_total = "Prawn Gyoza x4 = £14.04, Chicken Gyoza x1 = £3.11"
      expect(order.sub_total).to eq sub_total
    end
  end

  describe '#total' do
    it "raises an error if order basket is empty" do
      no_dishes_error = "You haven't added any dishes to your order. Please add dishes"
      expect { order.total }.to raise_error(no_dishes_error)
    end

    it "calculates the overall total for dishes and quantities in order basket" do
      order.add(dish_1, quantity_1)
      order.add(dish_2, quantity_2)
      expect(order.total).to eq "Total cost: £17.15"
    end
  end
end
