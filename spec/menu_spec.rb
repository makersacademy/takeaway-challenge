require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  describe '#initialize' do
    it "creates an instance of Menu class" do
      expect(subject).to be_an_instance_of(Menu)
    end

    it "stores list of dishes in an array" do
      expect(subject.dishes).to be_an_instance_of(Array)
    end

    it "stores hash of dishes" do
      expect(subject.dishes).to include({"Magherita" => "£5.00"}, {"Pepperoni" => "£8.00"})
    end
  end

  describe '#view_menu' do
    it "menu responds to view_menu" do
      expect(subject).to respond_to(:view_menu)
    end

    it "prints the menu_items" do
      expect(subject.view_menu).to eq(subject.dishes)
    end
  end
end
