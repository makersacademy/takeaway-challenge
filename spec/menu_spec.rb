require 'menu'

describe Menu do

    it "should have list of dishes" do
      menu = Menu.new
      menu.dish("crispy chilli beef", 5.99)
      expect(menu.list).to include({"crispy chilli beef" => 5.99})
    end
end
