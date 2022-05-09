require 'menu'

describe Menu do

  describe '#initialize' do
    it "creates an instance of Menu class" do
      expect(subject).to be_an_instance_of(Menu)
    end

    it "stores hash of dishes and their price" do
      expect(subject.dishes).to include({ "Margherita" => 5.00, "Pepperoni" => 8.00 })
    end
  end

  describe '#view_menu' do
    it "menu responds to view_menu" do
      expect(subject).to respond_to(:view_menu)
    end

    it "prints the dishes and their prices" do
      expect(subject.view_menu).to eq(["Margherita: £5.00", "Pepperoni: £8.00"])
    end
  end

  describe '#dish_available?' do
    it "checks if a dish is available" do
      expect(subject.dish_available?("Margherita")).to eq(true)
      expect(subject.dish_available?("Pepperoni")).to eq(true)
    end
  end
end
