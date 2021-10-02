require "takeaway"
require "menu"

RSpec.describe Takeaway do

  # Menu double
  let(:menu_double) { double(:menu, print: dishes) }
  let(:dishes) { { "pepperoni" => 8, "veggie" => 8, "hawaiian" => 9, "bbq chicken" => 10 } }

  describe "#view_menu" do
    context "when customer wants to view a menu" do
      it "prints a menu" do
        takeaway = Takeaway.new(menu_double)
        expect(takeaway.view_menu).to eq(dishes)
      end
    end
  end

  describe "#select_dishes" do
    context "when customer selects an available dish" do
      it "adds dishes to basket" do
        subject.add("pepperoni")
        expect(subject.basket).to eq(["pepperoni"])
      end
    end

    it "adds a second dish to the basket" do
      subject.add("pepperoni")
      subject.add("bbq chicken")
      expect(subject.basket).to eq(["pepperoni", "bbq chicken"])
    end
  end

  context "when customer selects something not on the menu" do
    it "raises an error when customer selects something not on the menu" do
      menu = Menu.new
      expect { subject.add("cheese") }.to raise_error("cheese is not on the menu")
    end
  end
end
