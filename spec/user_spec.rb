require './lib/user'
require "./lib/menu"

describe User do
  let(:menu) { Menu.new }
  let(:menu_hash){ {pizza: 3} } 

  describe "#Call menu items" do 
    it "Returns the full menu" do
      expect(subject.request_full_menu(menu)).to eq(menu.full_menu)
    end
  end
end 