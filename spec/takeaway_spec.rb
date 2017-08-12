require './docs/takeaway.rb'

describe Takeaway do
  let(:menu) { double "menu" }

  context "#header" do
    it "prints the main menu options" do
      message = "Welcome to the God of Cookery Takeaway.\n Choose an option\n1. See menu\n2. Choose dishes\n3. Confirm order\n4. Exit\n"
      expect { subject.header }.to output(message).to_stdout
    end
  end
  context "#show_menu" do
    it "displays the food menu" do
      expect(subject.show_menu).to respond_to(:display)
    end
  end
end
