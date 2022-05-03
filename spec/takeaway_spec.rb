require 'take_away'

describe TakeAway do
  let(:menu) { instance_double("Menu") }
  let(:confirmation) { instance_double("Order") }
  
  # let(:d1) { { :item => 1, :dish => "Mattar Paneer", :price => 12.50 } }
  # let(:d1) { { :item => 2, :dish => "Black Daal", :price => 7.50 } }
  # let(:d1) { { :item => 3, :dish => "Raita", :price => 3.50 } }
  # let(:d1) { { :item => 4, :dish => "Garlic Naan", :price => 3.50 } }
  
  subject(:take_away) { TakeAway.new(menu, confirmation) }

  it "should create an instance of class TakeAway" do
    expect(take_away).to be_instance_of(TakeAway)
  end
  
  describe "#view_menu" do
    it "should instruct menu to return dishes" do
      expect(menu).to receive(:view)
      take_away.view_menu
    end
  end

  describe "#add_dish(item_no, qty)" do
    it { is_expected.to respond_to(:add_dish).with(2).argument }

    xit "should fail if wrong item number entered" do
      expect(take_away.add_dish(1, 1)).to raise_error "please enter a valid dish number"
    end

    xit "should add the selected dish to the order" do
      take_away.add_dish(2, 1)
      expect(take_away.order).to eq([{ :dish_order => [{ :item => 2, :dish => "Black Daal", :price => 7.5 }], :qty => 1, :line_price => [7.50] }])
    end
  end

  describe "#view_basket" do
    xit "should return all items added to basket, with duplicate items qty added" do
      take_away.add_dish(1, 1)
      take_away.add_dish(1, 1)
      expect(take_away.basket).to eq(["2 x Mattar Paneer £12.5/each -> £25.0"])
    end
  end

  describe "#order" do
    xit "should show the order total" do
      take_away.add_dish(1, 1)
      take_away.add_dish(1, 1)
      expect(take_away.order_total).to eq("Your order total is £25.0")
    end 
  end

  describe "#total" do
    xit { is_expected.to respond_to(:total) }

    xit "should add up all sub-totals and return total" do
      take_away.add_dish(2, 2)
      take_away.add_dish(1, 3)
      take_away.add_dish(4, 1)
      expect(take_away.total).to eq(56.0)
    end
  end

  describe "#place_order" do
    xit { is_expected.to respond_to(:place_order) }
  end
  
end
