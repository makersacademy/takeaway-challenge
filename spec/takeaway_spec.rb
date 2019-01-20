require 'takeaway'

describe Takeaway do

  before(:each) do
    @menu = double('menu')
    @message = double('message')
    @item_list = { :pizza => 3, :chips => 2}
    allow(@menu).to receive(:menu).and_return(@item_list)
    allow(@menu).to receive(:contains_item?).and_return(true)
    @takeaway = Takeaway.new(@menu, @message)
  end




  it 'orders food from menu' do
    expect(@takeaway.order_food("pizza", 1)).to eq [{:food => :pizza, :quantity => 1}]
  end


  it 'calculates total price of order' do
    @takeaway.order_food(:pizza, 3)
    expect(@takeaway.total_cost).to eq 9
  end
 
  it 'checks price is correct' do
    @takeaway.order_food(:pizza, 3)
    expect(@takeaway.is_correct_cost?(9)).to eq true
  end


  it 'raises an error when total_cost at checkout is incorrect' do
    @takeaway.order_food(:pizza, 3)
    expect { @takeaway.checkout(10) }.to raise_error "Incorrect total"
  end
end
