require 'orderconsole'

describe OrderConsole do
  let(:chinese) { double }
  subject(:orderconsole) { described_class.new(chinese) }

  describe "#show_menu" do
    it "returns the menu dish" do
      menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
      allow(chinese).to receive_messages(restaurant_menu: menu)
      expect(orderconsole.show_menu).to eq(menu)
    end
  end

  describe "#order", :o do
    before do
      $stdin = StringIO.new("input")
    end

    # after do
    #   $stdin = STDIN
    # end

    it "records the user's choices" do
      expect(orderconsole.order).to eq("input")
    end
  end

end
