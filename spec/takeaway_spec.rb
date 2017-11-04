require "takeaway"

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:restaurant) { double(:restaurant, name: "mcdonalds", print_menu: "working") }

  describe "#initialize" do
    it "is initialized with a restaurants variable which is an empty array" do
      expect(subject.restaurants).to eq([])
    end
  end

  describe "#add" do
    it "adds a restaurant to the @restaurants array" do
      subject.add(restaurant)
      expect(subject.restaurants).to include(restaurant)
    end
  end

  describe "#remove" do
    it "removes a restaurant from the @restaurants array" do
      subject.add(restaurant)
      subject.remove(restaurant)
      expect(subject.restaurants).not_to include(restaurant)
    end
  end

  describe "#print_restaurants" do
    it "prints out the list of one restaurant name" do
      subject.add(restaurant)
      expect { subject.print_restaurants }.to output("mcdonalds\n").to_stdout
    end
    it "prints out the list of multiple restaurant names" do
      subject.add(restaurant)
      restaurant2 = double(:restaurant, name: "wagamama")
      subject.add(restaurant2)
      expect { subject.print_restaurants }.to output("mcdonalds\nwagamama\n").to_stdout
    end
  end

  describe "#print_menu" do
    it "prints out a menu if specified a restaurant in the list" do
      subject.add(restaurant)
      expect(subject.print_menu(restaurant)).to eq("working")
    end
    it "raises an error if asked to print a menu from a restaurant not on the list" do
      expect { subject.print_menu("mcdonalds") }.to raise_error("This restaurant is not included in our list.")
    end
  end
end
