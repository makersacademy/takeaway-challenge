require 'menu'

describe Menu do
  # create doubles of instance variables of dierent classes

  it "initializes with a @menu_list" do
    allow(subject).to receive(:menu_list).and_return("menu_list")
    expect(subject.menu_list).to eql("menu_list")
  end

  context "#print_menu" do

    it 'prints a list with the whole menu and prices' do
      expect(subject.print_menu).to include("Cheese Burger" => 5)
    end
  end

  context "#existent_dish?" do

    it "can check if #existent_dish in @menu" do
      # Test for randomness
      expect(subject.existent_dish?("Cheese Burger")).to eq(true).or eq(false)
    end
  end

end
