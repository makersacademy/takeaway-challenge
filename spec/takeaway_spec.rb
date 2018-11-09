require 'takeaway'
require 'dish'

describe Takeaway do
  let(:shensha) {shensha = Takeaway.new}
  let(:butter_chicken) {lemon_soup = Dish.new("butter chicken", 400 )}
  let(:chow_mein) {chow_mein = Dish.new("chow mein", 500)}
  let(:lemon_soup) {butter_chicken = Dish.new("lemon soup", 700)}

  # Make these mocks?

  it "#show_menu returns an array" do
    expect(subject.show_menu).to be_kind_of Hash
  end

  it "responds to #add_dish" do
    expect(subject).to respond_to(:add_dish).with(1).argument
  end

  it "an added dish should be visible when #show_menu" do
    subject.add_dish(butter_chicken)
    expect(subject.show_menu).to include("butter chicken" => 400)
  end

  it "respond_to #make_order" do
    expect(subject).to respond_to(:make_order)
  end



  describe "Test that require a menu in place" do

    before (:each) do
      shensha.add_dish(butter_chicken)
      shensha.add_dish(chow_mein)
      shensha.add_dish(lemon_soup)
    end

    it "#make_order returns an order hash of selected dishes" do
      expect(shensha.make_order("butter chicken", "lemon soup")).to include("butter chicken" => 400)
    end

    it "order_valid? checks whether all the ordered items are on the menu" do
      expect { shensha.create_order("butter chicken", 2, "caviar", 1, 900) }.to raise_error("Not on the menu")
    end

    it "throw error when incorrect total provided" do
      expect { shensha.create_order("butter chicken", 2, "lemon soup", 1, 1000) }.to raise_error("Total not correct")
    end

    it "return Thank you when correct total provided" do
      delivery_time = Time.now + (60*60)
      expect (shensha.create_order("butter chicken", 2, "lemon soup", 1, 1500)).to eq("Thank you! Your order was placed and will be delivered before #{delivery_time}")
    end

  end

end
