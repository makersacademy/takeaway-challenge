require "takeaway"

describe Takeaway do
  include_context "common takeaway"

  context "intitialized instance variable" do
    it "name" do
      expect(subject.instance_variable_get(:@name)).to eql("Dishoom")
    end
    it "menu" do
      expect(subject.instance_variable_get(:@menu)).to eql(menu_klass)
    end
    it "menu" do
      expect(subject.instance_variable_get(:@basket)).to eql(basket_klass)
    end
    it "checkout" do
      expect(subject.instance_variable_get(:@checkout)).to eql(checkout_klass)
    end
  end

  context "method responds to" do
    it "#show_menu" do
      expect(subject).to respond_to(:show_menu)
    end
    it "#show_basket" do
      expect(subject).to respond_to(:show_basket)
    end
    it "#add_to_basket" do
      expect(subject).to respond_to(:add_to_basket).with_keywords(:dish, :quantity)
    end
    it "#checkout" do
      expect(subject).to respond_to(:checkout)
    end
    it "#empty_basket" do
      expect(subject).to respond_to(:empty_basket)
    end
  end

  context "method functionality" do
    it "#show_menu delegates to Menu.print" do
      expect(menu_klass).to receive(:print).once
      subject.show_menu
    end
    it "#show_basket delegates to Basket.print" do
      expect(basket_klass).to receive(:print).once
      subject.show_basket
    end
    it "#add_to_basket delegates to Basket.add" do
      expect(basket_klass).to receive(:add).once
      subject.add_to_basket(dish: "chips", quantity: 1)
    end
    it "#checkout delegates to Checkout.order_confirmation? with Basket.details" do
      expect(checkout_klass).to receive(:order_confirmation?).once
      subject.checkout
    end
    it "#checkout delegates to #empty_basket" do
      expect(subject).to receive(:empty_basket).once
      subject.checkout
    end
    it "#empty_basket delegates to Basket.empty" do
      expect(basket_klass).to receive(:empty).once
      subject.empty_basket
    end
  end

  context "handling error" do
    it "#add_to_basket throws error if requested dish is not on menu" do
      allow(menu_klass).to receive(:dish_exists?).and_return(false)
      expect{subject.add_to_basket(dish: "disgusting food", quantity: 2)}.to raise_error("food is not on menu, bruh")
    end
    it "#add_to_basket throws error if not enough of the requested dish is available" do
      allow(menu_klass).to receive(:dish_available?).and_return(false)
      expect{subject.add_to_basket(dish: "soup", quantity: 10)}.to raise_error("not enough available to fulfill your order.")
    end
    it "#checkout throws error if basket is empty" do
      allow(basket_klass).to receive(:details).and_return([])
      expect{subject.checkout}.to raise_error("nothing in your basket, bruh")
    end
  end
end
