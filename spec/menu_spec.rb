require 'menu'

describe Menu do
  
  let(:mockDish)  { double :dish, :name => "Sushi", :price => 7 }
  let(:mockDish2)  { double :dish, :name => "Udon", :price => 8 }
  #food = [:mockDish, :mockDish2]
  subject {described_class.new(food)}


  describe "#list_menu" do
    it "lists out the menu items & prices" do
      food = [mockDish, mockDish2]
      menu = described_class.new(food)
      expect(menu.list_menu).to eq "Sushi - £7; Udon - £8"
    end
  end


end


