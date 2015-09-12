require 'menu'

describe Menu do

  describe "#initialize/new" do
    it "starts with an empy list of dishes" do
      new_menu = Menu.new
      expect(new_menu.dishes).to eq([])
    end
  end

end
