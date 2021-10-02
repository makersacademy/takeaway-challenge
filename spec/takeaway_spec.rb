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
    context "when customer selects a dish" do
      it "adds an available dish to the basket" do
        subject.add("pepperoni")
        expect(subject.basket).to eq(["pepperoni"])
      end
    end

    it "adds a second available dish to the basket" do
      subject.add("pepperoni")
      subject.add("bbq chicken")
      expect(subject.basket).to eq(["pepperoni", "bbq chicken"])
    end
  end

  it "raises an error when customer selects something not on the menu" do
    menu = Menu.new
    expect { subject.add("cheese") }.to raise_error("cheese is not on the menu")
  end

  describe "#calculate_total" do
    context "when customer has selected their dishes" do
      it "calculates the total sum" do
        menu = Menu.new
        subject.add("hawaiian")
        subject.add("veggie")
        expect(subject.calculate_total).to eq 17
      end
    end
  end

  describe "#check_total" do
    context "when customer wants to check their total is correct" do
      it "checks their total against the calculated_total method" do
        menu = Menu.new
        subject.add("hawaiian")
        subject.add("veggie")
        expect(subject.check_total(17)).to be_truthy
      end
    end
  end
end
