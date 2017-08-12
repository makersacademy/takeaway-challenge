require './docs/takeaway.rb'

describe Takeaway do
  let(:menu) { double "menu" }

  context "#initialize" do
    it "basket is empty by default" do
      expect(subject.basket.size).to eq 0
    end
  end

  context "#header" do
    it "prints the main menu options" do
      message = "Welcome to the God of Cookery Takeaway.\n Choose an option\n1. See menu\n2. Choose dishes\n3. Basket\n4. Exit\n"
      expect { subject.header }.to output(message).to_stdout
    end
  end
  context "#show_menu" do
    it "prints the food menu" do
      expect(subject.show_menu).to respond_to(:display)
    end
  end
  context "#choose_dish" do
    it "selects a dish and puts it into basket" do
      subject.choose_dish(1)
      expect(subject.basket.size).to eq 1
    end
  end
  # context "#basket" do
  #   it "prints selected items and sums up cost"
  #   expect(subject.@cost).to eq 7657
  # end
end
