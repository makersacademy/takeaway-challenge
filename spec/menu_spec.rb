require 'menu'

describe Menu do
  context "#initialize" do
    it "should create a list of menu items and prices" do
      expect(subject).not_to be_nil
    end
  end

  context "#print_menu" do
    it "should print out menu in a readable format" do
      expect { subject.print_menu }.to output(include("Naan: £2.00")).to_stdout
    end
  end
end
