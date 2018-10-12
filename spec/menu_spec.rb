require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe "#menu" do
    it "returns an array of the menu items" do
      menu_array = [
            { name: "Miso Soup", nickname: :miso, price: 1.50 },
            { name: "Soba Noodles", nickname: :soba, price: 4.50 },
            { name: "Vegetable Tempura", nickname: :tempura, price: 3.50 },
            { name: "Avocado Maki", nickname: :maki, price: 4.00 },
            { name: "Teriyaki Tofu Don", nickname: :tofu, price: 5.00 },
            { name: "White Rice", nickname: :rice, price: 1.00 },
            { name: "Green Tea", nickname: :tea, price: 1.00 },
          ]
      expect(menu.menu).to eq menu_array
    end
  end
end
