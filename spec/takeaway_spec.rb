require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new }

  context "#read_menu" do
    it "restaurant has list of dishes" do
      expect(takeaway.read_menu).not_to be_empty
    end
  end

  context "#order_food" do

    it "cannot order a dish if not on the menu" do
      err_msg="This dish is not available on menu"
      expect { takeaway.order("Sausages") }.to raise_error(err_msg)
    end

    it "default order quantity will be 1" do
      takeaway.order("Chips")
      expect(takeaway.basket.value?(1)).to be true
    end

    it "can order extra quantity" do
      takeaway.order("Chips", 3)
      expect(takeaway.basket.value?(3)).to be true
    end

    it "can order multiple dishes" do
      takeaway.order("Chips", 3)
      takeaway.order("Chicken Tikka")
      expect(takeaway.basket.length).to be >= 1
    end

  end

  context "#review_order" do

    it "raises error when basket empty" do
      err_msg = "basket is empty, no dishes ordered"
      expect { takeaway.basket_summary }.to raise_error(err_msg)
    end

    it "shows order summary " do
      takeaway.order("Chips", 3)
      takeaway.order("Burger", 2)
      takeaway.order("Chicken Tikka", 2)
      expect(takeaway.basket_summary).to eq("Chips x3 = £2.67, Burger x2 = £5.98, Chicken Tikka x2 = £7.98")
    end

    it "calculates total" do
      takeaway.order("Chips", 3)
      takeaway.order("Burger", 2)
      takeaway.order("Chicken Tikka", 2)
      expect(subject.order_value).to eq("Total: £16.63")
    end

    it "raises error when confirm_order amount not eqault total value" do
      takeaway.order("Chips", 3)
      takeaway.order("Burger", 2)
      takeaway.order("Chicken Tikka", 2)
      err_msg = "Confirm order value of £16.63"
      expect { takeaway.confirm_order }.to raise_error(err_msg)
    end


  end


end
