require 'order'
require 'menu'

describe Order do
  before (:each) do
    order = Order.new
  end
  it {is_expected.to respond_to(:basket)}


  describe "#add_to_basket" do
    it "can add elements and their respective quantity to the basket" do
      menu = Menu.new
      subject.add_to_basket('pizza', 2)
      expect(subject.basket).to include('pizza' => 2)
    end
  end

  describe "#check_availability" do
    it "checks that the choice of dishes is admissible" do
      menu = Menu.new
      expect {subject.check_availability({'pasta' => 2})}.to raise_error("Your choice of dishes is not available")
    end
  end

  describe "#display_basket" do
    it "should display the content of the basket to STDOUT" do
      order = Order.new
      order.add_to_basket('pizza', 2)
      expect { order.display_basket }.to output.to_stdout
    end
  end
  describe "#order_check" do
    it "checks with the customer that the order total is correct" do

    end
  end
end
