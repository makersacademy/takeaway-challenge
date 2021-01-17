require 'menu'

describe Menu do

  let(:menu) { described_class.new }
  let(:dish) { "Battered cod" }
  let(:price) { 3.99 }

  describe "#view_menu" do
    it "shows a list of dishes" do
      expect(menu.view_menu.has_key?(dish)).to be_truthy
    end

    it "shows the corresponding price" do
      expect(menu.view_menu[dish]).to eq price
    end
  end
end
