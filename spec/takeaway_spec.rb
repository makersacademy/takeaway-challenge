require 'takeaway'

describe Takeaway do

  #instantiates the takeaway, and initalizes it with a menu arguement
  subject(:takeaway) { described_class.new(menu: menu, basket: basket) }
  let(:menu) { double(:menu, print: menu_example) }
  let(:menu_example) { "Rice £5" }

  it "displays menu" do
    expect(takeaway.print_menu).to eq("Rice £5")
  end

 
  it "receives the method to print basket basket" do
    expect(basket).to receive(:print).once 
    subject.print_basket
  end

  let(:basket) { double(:basket, print: basket_example) }
  let(:basket_example) { "Rice 100, Soup 20, Chefs Special 10" }
  it "shows the basket and quantity" do
    expect(takeaway.print_basket).to eq ("Rice 100, Soup 20, Chefs Special 10")
  end

end
