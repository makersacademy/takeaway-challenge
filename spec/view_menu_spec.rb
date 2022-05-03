require 'view_menu'

describe ViewMenu do

  describe "#list_of_dishes" do 
    it "provides a menu containing dishes and their prices" do
      menu = double(:menu)
      allow(menu).to receive(:dishes).and_return({
        "meatball sub" => 5,
        "steak n cheese sub" => 6,
        "low cal turkey sub" => 4
      })
      expect(subject.list_of_dishes).to eq menu.dishes
    end
  end
  
end
