require 'menu'

describe "Menu" do

  let(:menu) { Menu.new }

  describe "creation" do

    it "should create a new instance of menu" do
      expect(menu).to be_an_instance_of(Menu)
    end
  end

  describe "#show" do

    it "should show a dish with a price" do
      expect(menu.show).to eq("dish - £9.99")
    end
  end
end
