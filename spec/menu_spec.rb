require 'menu'

describe Menu do

  describe "#display_menu" do

    it "displays dish and price" do
      expect(subject.display_menu).to eq ( {
        "crispy chilli beef" => 5.99,
        "sweet and sour chicken" => 4.99,
        "egg fried rice" => 2.99
        } )
    end
  end

  describe "#choose_dish" do

    it "can choose dish from menu" do
      expect(subject).to respond_to(:choose_dish).with(1).argument
    end

    it "can only order form the menu" do
      expect(subject.choose_dish "crispy chilli beef").to eq ["crispy chilli beef"]      end
    end
end
