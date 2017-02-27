require 'order'

describe Order do

  context "#order_item" do

    it 'checks that multiple items are selected correctly' do
      subject.order_item(1, 4)
      subject.order_item(1, 6)
      expect(subject.shopping_basket).to include(["Calamari Fritti", 3.99] => 10)
    end
  end

  context "#show_basket" do

    it "shows the current shopping basket" do
      subject.order_item(4,1)
      expect(subject.show_basket).to eq "1 x [\"Vegetable Lasagne\", 6.99]"
    end
  end

  context "#find_total" do

    it "should calculate total cost of shopping basket" do
      subject.order_item(1,4) #15.96
      subject.order_item(2,1) #4.99
      expect(subject.find_total).to eq 20.95
    end
  end

  context "#check_price" do

    it "raises error if payment amount doesn't match price of food" do
      expect{subject.check_price(10)}.to raise_error "Please double-check the price again."
    end
  end

  context "#confirm_order" do

    it "ensures that the order can only be confirmed if price has been confirmed" do
      expect{subject.confirm_order}.to raise_error "Please check the price again."
    end
  end


end
