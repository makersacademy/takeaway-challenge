require 'menu'

describe Menu do

  context "#print_menu" do

    it "should print the menu" do
      expect(subject).to respond_to(:print_menu)
    end

  end

  context "#select_dishes" do
    it "should search dishes in menu by given number" do
      expect(subject.select_dishes(1)).to eq ({ :dish => "Olives and sun-dried tomatos", :price => 2 }) 
    end
  end

end
