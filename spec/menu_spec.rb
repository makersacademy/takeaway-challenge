require 'menu'

describe Menu do

  describe "#display_menu"
    it "displays dish and price" do
      expect(subject.display_menu).to eq ( { "crispy chilli beef" => 5.99, "sweet and sour chicken" => 4.99, "egg fried rice" => 2.99})
    end

end
