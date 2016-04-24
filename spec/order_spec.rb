require 'order'

describe Order do

  describe "#add_to_order" do

    it "should add a single item by default" do
      subject.add_to_order("Curry")
      expect(subject.show_order).to include ({"Curry" => 1})
    end

    it "should allow multiple dishes to be added at once" do
      subject.add_to_order("Curry", 5)
      expect(subject.show_order).to include ({"Curry" => 5})
    end
  end

  # describe "#calculate_total" do

  #   # it "should get correct price" do
  #   #   # do i need to pass the menu, in order to get prices?
  #   # end
  # end

end