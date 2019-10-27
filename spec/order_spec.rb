require "order"
require "menu"
require "dish"

describe Order do
  let(:ramen) { double :Dish }
  let(:menu) { double :menu }
  menu_instance = Menu.new
  subject(:order) { described_class.new(menu_instance) }
  beef_rice = Dish.new("Beef Rice", 4)
  egg_rice = Dish.new("Egg Rice", 2)

  context "items" do
  end

  context "order basket" do
    before do
      allow(menu).to receive(:available?).and_return(true)
      menu_instance.add(beef_rice)
      menu_instance.add(egg_rice)
    end

    it "has an order basket" do
      expect(subject.basket).to eq([])
    end

    it "adds an item to the basket" do
      subject.add("Beef Rice")
      expect(subject.basket).to include({ "Beef Rice" => 4 })
    end

    it "removes an item from the basket" do
      subject.add("Beef Rice")
      subject.remove("Beef Rice")
      expect(subject.basket).not_to include({ "Beef Rice" => 4 })
    end

    it "doesn't add items that are not on the menu" do
      allow(menu).to receive(:available?).and_return(false)
      expect { subject.add(ramen) }.to raise_error "This dish does not exist on the menu"
    end
  end

  context "total" do
    before do
      subject.add("Beef Rice")
      subject.add("Egg Rice")
    end

    it "adds up the total for all the selected items" do
      expect(subject.calculate_total).to eq(6)
    end
  end

  context "printing" do
    before do
      subject.add("Beef Rice")
      subject.add("Egg Rice")
    end

    it "shows the contents of the basket" do
      expect { subject.show_basket }.to output(
        "Beef Rice: 4\nEgg Rice: 2"
      ).to_stdout
    end

    it "prints the total to the screen" do
      expect { subject.show_total }.to output("Your order total is £6").to_stdout
    end

  end
end
