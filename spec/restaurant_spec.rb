require 'restaurant'

describe Restaurant do

  describe "#print_menu" do
    it "shows the menu of available dishes" do
      expect(subject.print_menu).to include({"Wings" => 3.00})
    end
  end
end
