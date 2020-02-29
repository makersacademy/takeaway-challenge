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
      expect(subject).to respond_to(:add_to_basket).with(2).arguments
    end
    it "#checkout" do
      expect(subject).to respond_to(:checkout)
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
      subject.add_to_basket("chips", 1)
    end
    it "#checkout delegates to Checkout.order_confirmation? with Basket.details" do
      expect(checkout_klass).to receive(:order_confirmation?).once
      subject.checkout
    end
  end
end
