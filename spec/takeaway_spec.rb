require "takeaway"

describe Takeaway do

  describe "#show_menu" do
    it "shows the menu" do
      expect(subject).to respond_to(:show_menu)
    end
    it "shows prices" do
      expect(subject.show_menu).to eq(@menu)
    end
  end
  describe "#select_food" do
    it "responds to the select food method" do
      expect(subject).to respond_to(:select_food)
    end
    it "retrieves input from user" do
      subject.select_food
      expect(dish).to be_a(String)
    end
end
