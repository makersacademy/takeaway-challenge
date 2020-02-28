require "dish"

describe Dishes do

  describe "#list" do
    it "gets the list of dishes' names and prices" do
      expect(subject.list).to eq [{ :name => "Pizza", :price => 15 }, { :name => "Burger", :price => 12 }, { :name => "Salad", :price => 10 }]
    end
  end

end
