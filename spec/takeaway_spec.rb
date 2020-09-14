require "takeaway"

describe Takeaway do
  before(:each) { @menu_list = "1: Pizza, £7  2: Pasta, £6  3: Beer, £4  "
  @order = [{ :Pizza => 7}, {:Pasta => 6}, {:Beer => 4}] }
  
  let(:menu) { double 'menu' }
  
  subject(:takeaway) { Takeaway.new }

  it "responds to menu" do    
    expect(takeaway).to respond_to(:list_dishes)
  end

  it "responds to place_order" do
    expect(takeaway).to respond_to(:place_order) 
  end

  it "responds to view_order" do
    expect(takeaway).to respond_to(:view_order)
  end

  it "Checks that items are added up" do
    allow(menu).to receive(:item).and_return(@order)
    takeaway.select(1,2,3,3)
    expect(takeaway.view_order).to eq "Total = £17"
  end

  it "throws error message if @order is empty and user attempts to place order" do
    expect { takeaway.place_order }.to raise_error("Basket is empty") 
  end

  it "responds to clear basket" do
    expect(takeaway).to respond_to(:clear_basket)
  end

  it "clears the basket" do
    takeaway.select(1, 2, 3, 3)
    takeaway.clear_basket
    expect(takeaway.order.length).to eq 0
  end
  
  it "prints the menu" do
    allow(menu).to receive(:list_items).and_return(@menu_list)
    expect(takeaway.list_dishes).to eq(@menu_list)
  end
    
  it "adds an item to the order array" do
     # allow(takeaway.select(2,2,2)).to receive(@menu).and_return(@menu)
     expect { takeaway.select(2, 2, 2) }.to change { takeaway.order }
  end

  it "throws an error message if the number of items ordered is wrong" do
    expect { takeaway.select(1, 2, 3, 5) }.to raise_error("Wrong total of items")
  end

  # it "shows the contents of the basket" do
  #   takeaway.select(1,1,2)
  #   allow(menu).to receive(:list_items).and_return(@menu_list)
  #   expect(takeaway.view_basket).to eq ""
  # end
end
