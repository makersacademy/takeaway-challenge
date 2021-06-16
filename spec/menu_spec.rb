require "menu"

describe Menu do
  subject(:menu){ Menu.new }

  describe "initialize" do

    it "creates an instance of a menu" do
      expect(subject).to be_an_instance_of(Menu)
     end

    it "stores names and prices of dishes in an hash" do
      expect(subject.dishes).to be_an_instance_of(Hash)
    end

    it "is empty when creating a new menu" do
      expect(subject.dishes).to be_empty
    end
  end

  describe "#add_to_menu" do

    it { is_expected.to respond_to(:add_to_menu).with(2).arguments }

    it "adds dishes using dish names and prices" do
      expect { subject.add_to_menu("Burger", 4) }.to change { subject.dishes.length }.by(1)
    end

    it "adds several dishes" do
      subject.add_to_menu("Chips", 2)
      subject.add_to_menu("Pizza", 6)
      expect(subject.dishes.length).to eq(2)
    end
  end

  describe "#check_out" do

    it { is_expected.to respond_to(:check_out).with(1).argument }

    it "calculates the total of the order" do
      takeaway = Takeaway.new
      menu.add_to_menu("Chips", 2)
      menu.add_to_menu("Pizza", 6)
      takeaway.add_to_order("Chips", 2)
      takeaway.add_to_order("Pizza", 1)
      expect(menu.check_out(takeaway)).to eq(10)
    end 
  end
end