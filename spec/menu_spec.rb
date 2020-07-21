require "menu"

describe Menu do

  describe "#print_menu" do
    it "gets the list of dishes' names and prices" do
      expect(subject.print_menu).to eq [{ :name => "Pizza", :price => 15 }, { :name => "Burger", :price => 12 }, { :name => "Salad", :price => 10 }]
    end
  end

end
