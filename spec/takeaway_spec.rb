require "takeaway"

describe Takeaway do
  context  do
    let(:takeaway) { Takeaway.new("Chutney in Putney") }
    let(:dish) { double(name: "Mango Chutney", get_formatted_price: "£1.00", available: true) }
    it "names the takeaway on intitialisation" do
      expect(takeaway.name).to eq("Chutney in Putney")
    end
    it "#add_dish adds specified dish to the menu" do
      takeaway.add_dish(dish)
      expect(takeaway.menu.include?(dish)).to eq true
    end
    it "#return_menu prints the menu with an index and price" do
      takeaway.add_dish(dish)
      expect{takeaway.return_menu}.to output("1: Mango Chutney £1.00\n").to_stdout
    end

  end
end
