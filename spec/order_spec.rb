require "order"
require "menu"

describe Order do
  describe "#see_menu method" do
    it "should let us see a list of dishes with prices" do
      expect { subject.see_menu }.to output(include("Pasta", "£9", "Rice")).to_stdout # refactor with double menu
    end
  end

  # describe "#select_meal method" do
  #   it "should let us select multiple dishes" do
  #     expect(subject.see_menu).to 
  #   end
  # end
end
