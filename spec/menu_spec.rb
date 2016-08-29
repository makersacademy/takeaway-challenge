require 'menu'

describe Menu do
  let(:CSV) {double(:CSV, foreach: ["1012","Pizza","1.99"])}
  subject(:menu) {described_class.new}
  let(:dish1) { double(:dish, name: "Pizza", price: 1.99) }
  let(:dish2) { double(:dish, name: "Burger", price: 2.11) }

  describe "#initialize" do
    it "passes the filename/path to the #foreach method" do
      expect(CSV).to receive(:foreach).with("./lib/menu.csv")
      other_menu = Menu.new
    end

    it "returns warning if wrong filename/path is passed to foreach method" do
      message = "File doesn't exist. Failed to load file.\n"
      expect{Menu.new("menu2.xlsx")}.to output(message).to_stdout
    end
  end

  describe "#menu" do
    it "returns a copy of the original menu" do
      menu_copy = menu.menu
      expect(menu.instance_variable_get(:@menu_content)).to eq menu_copy
    end
  end
end
