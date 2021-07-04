require 'takeaway'

describe Takeaway do

  #instantiates the takeaway, and initalizes it with a menu arguement
  subject(:takeaway) { described_class.new(menu: menu, basket: basket) }
  let(:menu) { double(:menu, print: menu_example) }
  let(:menu_example) { "Rice £5" }

  it "displays menu" do
    expect(takeaway.print_menu).to eq("Rice £5")
  end

  # it "receives the method to print basket" do
  #   expect(basket).to receive(:print).once 
  #   subject.print_basket
  # end

  let(:basket) { double(:basket, print: basket_example) }
  let(:basket_example) { "Rice 100, Soup 20, Chefs Special 10" }
  it "shows the basket" do
    expect(takeaway.print_basket).to eq ("Rice 100, Soup 20, Chefs Special 10")
  end

  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  it "responds to 2 arguements" do
    expect(subject).to respond_to(:add_to_basket).with(2).arguments
  end

  it "adds a dish to order" do
    subject.add_to_basket(:Chicken, 2)
    subject.add_to_basket(:Rice, 2)
    expect(subject.order_arr).to eq [:Chicken, :Chicken, :Rice, :Rice]
  end

  it "totals the price" do
  expect(subject.total(3.99, 4.99)).to equal(8.98)
  end

end
