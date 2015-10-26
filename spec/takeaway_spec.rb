require 'takeaway'

describe TakeAway do

  context "#read_menu" do
    it "restaurant has list of dishes" do
      expect(subject.read_menu).not_to be_empty
    end
  end

  context "#order_food" do

    it "cannot order a dish if not on the menu" do
      err_msg="This dish is not available on menu"
      expect { subject.order("Sausages") }.to raise_error(err_msg)
    end

    it "default order quantity will be 1" do
      subject.order("Chips")
      expect(subject.basket.value?(1)).to be true
    end

    it "can order extra quantity" do
      subject.order("Chips", 3)
      expect(subject.basket.value?(3)).to be true
    end

    it "can order multiple dishes" do
      subject.order("Chips", 3)
      subject.order("Chicken Tikka")
      expect(subject.basket.length).to be >= 1
    end

  end

  context "#review_order" do

    it "raises error when basket empty" do
      err_msg = "basket is empty, no dishes ordered"
      expect { subject.basket_summary }.to raise_error(err_msg)
    end

    it "shows order summary " do
      subject.order("Chips", 3)
      subject.order("Burger", 2)
      subject.order("Chicken Tikka", 2)
      message = "Chips x3 = £2.67, Burger x2 = £5.98, Chicken Tikka x2 = £7.98"
      expect(subject.basket_summary).to eq(message)
    end

    it "calculates total" do
      subject.order("Chips", 3)
      subject.order("Burger", 2)
      subject.order("Chicken Tikka", 2)
      expect(subject.order_value).to eq("Total: £16.63")
    end

    it "raises error when confirm_order amount not eqault total value" do
      subject.order("Chips", 3)
      subject.order("Burger", 2)
      subject.order("Chicken Tikka", 2)
      err_msg = "Confirm order value of £16.63"
      expect { subject.confirm_order }.to raise_error(err_msg)
    end


  end


end
