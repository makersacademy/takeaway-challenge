require "menu"

describe Menu do

  describe "#list" do
    it "lists the hash of pizzas available with prices" do
      expect(subject.list).to include("four_cheese" => 9, "hawaiian" => 9)
    end
  end
end
