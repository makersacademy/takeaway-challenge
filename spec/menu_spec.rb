require "menu.rb"

describe Menu do
  context "#initialize"
  it "should list the names of dishes and their prices" do
    expect(subject.dish_list).to be_an(Array)
  end

  it "should have a list of dishes" do
    expect(subject.dish_list).to eq(::AVAILABLE_DISHES)
  end

  it "should have a basket to hold the order" do
    expect(subject.basket).to eq(subject.basket)
  end

  context "#view_menu" do
    let(:dish) { double :dish, name: "1/2 chicken", price: 5.99 }
    it "should return a menu" do
      menu = Menu.new([dish])
      expect { menu.view_menu }.to output("Welcome to Nandos, here's our menu of available dishes").to_stdout
    end
  end
end
