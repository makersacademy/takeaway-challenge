require 'menu'
require 'spec_helper'


describe Menu do
  subject(:menu) { described_class.new }

  describe "#defaults" do
    it "loads dishes from menu.csv" do
      expect(menu.list.count).to eq 21
    end
  end

  describe "#view_menu" do
    it "displays the list of dishes" do
      expect { menu.view_menu }.to output.to_stdout
    end
  end

  context "adding an order" do
    before :each do
      menu.begin_order
    end

    describe "#begin_order" do
      it "creates a new order" do
        expect(menu.current_order).not_to be nil
      end
    end

    describe "#select_dish" do
      it "adds the selected dish to the order" do
        menu.select_dish(3)
        expect(menu.current_order.basket).to eq([{:name => "Margherita", :price => 8.95, :quantity => 1}])
      end
    end

    describe "#proceed_to_checkout" do
      before :each do
        menu.select_dish(3)
        menu.select_dish(1)
      end

      it "gets the total and shows the items in the basket" do
        expect{menu.proceed_to_checkout}.to output.to_stdout
      end
    end
  end
end
