require "order"
require "menu"

describe Order do
  describe "#see_menu method" do
    it "should let us see a list of dishes with prices" do
      expect { subject.see_menu }.to output(include("Pasta", "£9", "Rice")).to_stdout # refactor with double menu
    end
  end

  describe "#select_meal method" do
    it "should let us select multiple dishes" do
      expect(subject.select_meal([1, 3])).to eq(subject.main_menu.values_at(0, 2))
    end
  end
end
