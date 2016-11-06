require 'takeaway'
require 'order'
require 'dotenv'
Dotenv.load

describe Takeaway do

  subject(:takeaway) {described_class.new('./lib/menu.csv')}

  describe "initializes with" do
    it "a menu" do
      expect(takeaway.instance_variable_get(:@menu)).to be_instance_of(Menu)
    end

    it "a menufile" do
      expect(takeaway.instance_variable_get(:@menu_file)).to eq('./lib/menu.csv')
    end
  end

  describe "has attributes" do
    it "order" do
      expect(takeaway).to respond_to(:order)
    end
  end

  describe "print_menu" do
    it "#prints menu" do
      expect(takeaway.print_menu).to eq({:pasta=>"10.00", :pizza=>"9.00", :salad=>"4.00", :chips=>"3.00", :icecream=>"4.00"})
    end
  end

  describe "#please_may_i_order" do
    it "creates a new instance of order" do
      takeaway.please_may_i_order
      expect(takeaway.order).to be_instance_of(Order)
    end

    it "returns a string saying you can!" do
      expect(takeaway.please_may_i_order).to eq "Sure, go right ahead!"
    end
  end

  describe "making order" do
    before do
      takeaway.please_may_i_order
      takeaway.add_item(:pasta, 2)
      takeaway.add_item(:salad, 1)
      takeaway.add_item(:icecream, 4)
    end

    describe "#add_item" do
      it "add items to basket" do
        expect(takeaway.order.basket).to eq(pasta: 2, salad: 1, icecream: 4)
      end
    end

    describe "#print_order" do
      it "prints the contents of the basket" do
        expect(takeaway.print_order).to eq "2 x pasta = £20.00, 1 x salad = £4.00, 4 x icecream = £16.00\nTotal: £40.00"
      end
    end

    describe "#confirm_order" do
      before do
        allow(takeaway).to receive(:send_text)
      end
      it "outputs a string saying a text message will be sent" do
        expect(takeaway).to receive(:send_text).with(ENV['NUMBER_TO'])
        expect(takeaway.confirm_order(ENV['NUMBER_TO'])).to eq "Thank you for placing your order."
      end
    end
  end

end
