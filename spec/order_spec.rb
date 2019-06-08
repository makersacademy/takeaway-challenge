require "order"

RSpec.describe "Order" do

  before(:each) do
    @menu = double("menu", menu_contents: { "Fish" => 3, "Chips" => 2 }, view: "expected_menu")
    @menu_contents = { "Fish" => 3, "Chips" => 2 }
    @cost_calculator = double("cost_calculator", total_price: 8)
    @order = Order.new(@menu, @cost_calculator)
    @displayed_menu = "expected_menu"
  end

  describe "#initialize" do
    it "stores a menu" do
      expect(@order.menu).to eq(@menu)
    end
    it "has an empty current_order array" do
      expect(@order.current_order).to eq([])
    end
  end

  describe "#view_menu" do
    it 'calls the view method from the menu class' do
      expect(@order.view_menu).to eq(@displayed_menu)
    end
  end

  describe "#place_order" do
    it 'takes a dish as an argument and stores it' do
      @order.place_order("Fish", 2)
      expect(@order.dish).to eq("Fish")
    end
    it 'takes a quantity as an argument and stores it' do
      @order.place_order("Fish", 2)
      expect(@order.quantity).to eq(2)
    end
    it 'saves my order in array current_order as a Hash' do
      @order.place_order("Fish", 2)
      expect(@order.current_order).to eq([{ "dish" => "Fish", "quantity" => 2 }])
    end
    it 'can record multiple order in the current_order array' do
      @order.place_order("Fish", 2)
      @order.place_order("Chips", 1)
      expect(@order.current_order).to eq([{ "dish" => "Fish", "quantity" => 2 }, { "dish" => "Chips", "quantity" => 1 }])
    end
    it 'tells me what I have ordered' do
      expected_message = "2 x Fish have been added to your order"
      expect(@order.place_order("Fish", 2)).to eq(expected_message)
    end
    it "does not allow me to select a dish not on the menu" do
      expect { @order.place_order("Chocolate", 3) }.to raise_error("Item is not on the menu")
    end
  end

  describe "#running_total" do
    it "returns the cost of your order" do
      allow(@cost_calculator).to receive(:total_price) { 8 }
      expect(@order.running_total).to eq("Your total so far: 8")
    end
  end

  describe "#checkout" do
    it "raises an error if the user checks out with a number which does not match the total price" do
      allow(@cost_calculator).to receive(:total_price) { 8 }
      expect { @order.checkout(7) }.to raise_error("Payment incorrect")
    end
    it "send the user a text message if the payment is correct" do
      allow(@cost_calculator).to receive(:total_price) { 8 }
      expect(@order.checkout(8)).to eq("Order confirmed")
    end
  end
end
