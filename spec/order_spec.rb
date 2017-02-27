require 'order'

describe Order do

  let(:order) { described_class.new }
  let(:dish) {double(:dish, :number => 3, :name => "Margherita", :price => 8.95) }
  let(:menu) {double(:menu)}
  let(:sms) {double(:sms, :send_text => message)}
  message = "Your order has been confirmed."

  before :each do
    allow(menu).to receive(:list).and_return([{:number => 3, :name => "Margherita", :price => 8.95}, {:number => 1, :name => "Antipasti", :price => 12.95}])
    # allow(order).to receive(:add_dish_obj).with(3, menu).and_return(order.list << dish)
  end

  describe "defaults" do
    it "basket is an empty array to begin" do
      expect(order.basket).to be_empty
    end
  end

  context "adding dishes and ordering" do
    # before :each do
    #   order.add_dish(3, menu)
    # end

    describe "#add_dish" do

      it "adds dish objects to list" do
        allow(order).to receive(:create_dish).and_return(dish)
        order.add_dish(3, menu)
        expect(order.basket).to eq([dish])
      end


      # it "adds 1 to the dish quantity if the selected dish is already in the basket" do
      #   order.add_dish(3, menu)
      #   expect(order.basket).to eq([{:name => "Margherita", :price => 8.95, :quantity => 2}])
      # end
      #
      # it "adds multiple dishes" do
      #   order.add_dish(1, menu)
      #   order.add_dish(3, menu)
      #   expect(order.basket).to eq([{:name => "Margherita", :price => 8.95, :quantity => 2}, {:name => "Antipasti", :price => 12.95, :quantity => 1}])
      # end
    end

    describe "#get_total" do
      it "gets the total of all items in basket" do
        order.add_dish(3, menu)
        order.add_dish(1, menu)
        expect(order.get_total).to eq(21.90)
      end
    end

    # describe "#get_summary" do
    #   it "returns a hash with dish details" do
    #     order.add_dish(1, menu)
    #     expect(order.get_total).to eq(21.90)
    #   end
    # end

    describe "#place_order" do
      it "confirms order has been placed and send a text message" do
        order.add_dish(3, menu)
        allow(order).to receive(:send_text).and_return(message)
        expect(order.place_order).to eq(message)
      end
    end
  end


end



# it "object adds 1 to the dish quantity if the selected dish is already in the basket" do
#   order.add_dish_obj(3, menu)
#   expect(order.basket).to eq([{:name => "Margherita", :price => 8.95, :quantity => 2}])
# end
