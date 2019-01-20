require 'takeaway'

describe Takeaway do

  before(:each) do
    @menu = double('menu')
    @message = double('message')
    @item_list = { :pizza => 3, :chips => 2}
    allow(@menu).to receive(:menu).and_return(@item_list)
    allow(@menu).to receive(:contains_item?).and_return(true)
    allow(@message).to receive(:send_message).and_return('Order complete')
    @takeaway = Takeaway.new(@menu, @message)
  end

  context 'Viewing the  menu' do
    it 'displays menu' do
      expect(@takeaway.menu).to eq @item_list
    end
  end

  context "Ordering from the menu" do
    it 'orders food from menu' do
      expect {@takeaway.order_food("pizza")}.to change{@takeaway.basket.count}.by 1
    end
  
    it 'orders multiple items' do
      @takeaway.order_food("pizza", 2)
      @takeaway.order_food("chips")
      expect(@takeaway.basket).to eq({:pizza => 2, :chips => 1})
    end

    it 'gives a message if trying to order item not on the menu' do
      allow(@menu).to receive(:contains_item?).and_return(false)
      expect(@takeaway.order_food("curry")).to eq Takeaway::NO_ITEM_MESSAGE
    end

    it 'items not on the menu should not be in the basket' do
      @takeaway.order_food("pizza", 2)
      @takeaway.order_food("chips")
      allow(@menu).to receive(:contains_item?).and_return(false)
      @takeaway.order_food("curry")
      expect(@takeaway.basket).to eq({:pizza => 2, :chips => 1})
    end
  end

  context "end of order" do
    it 'calculates total price of order' do
      @takeaway.order_food(:pizza, 3)
      expect(@takeaway.total_cost).to eq 9
    end
   
    it 'raises an error when total_cost at checkout is incorrect' do
      @takeaway.order_food(:pizza, 3)
      expect { @takeaway.checkout(10) }.to raise_error "Incorrect total"
    end

    it "total_cost at checkout is correct then order is complete and message is sent" do
      @takeaway.order_food(:pizza, 3)
      expect { @takeaway.checkout(9) }.to_not raise_error
    end
  end
end
