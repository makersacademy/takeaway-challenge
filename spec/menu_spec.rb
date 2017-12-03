require 'menu'

describe Menu do
  context "#initialize" do
    it "should list all menu items and prices" do
      expect(subject.menu_items).not_to be_nil
    end
  end

  context "#print_menu" do
    it "should print out menu in a readable format" do
      expect { subject.print_menu }.to output(include("Naan: £2.00")).to_stdout
    end
  end

  context "#price" do
    it "should return the price of a menu item" do
      expect(subject.price("Aloo Ghobi")).to eq(5.50)
    end
  end
end
