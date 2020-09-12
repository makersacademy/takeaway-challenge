require "takeaway"

describe Takeaway do
  
  let(:menu) {double 'menu'}
  
  subject(:takeaway) {Takeaway.new(menu)}

  
  it "respends to menu" do
  
    expect(takeaway).to respond_to(:list_dishes)
  end

  it "prints the menu" do
    allow(menu).to receive(:list_items).and_return("Pizza")
  
    expect(takeaway.list_dishes).to eq("Pizza")
  end
    
  it "adds an item to the order array" do
    allow(menu).to receive(:select).and_return(1)
    expect{takeaway.select(1)}.to change{takeaway.order}
  end

  it "throws an error message if the number of items ordered is wrong" do
  expect {takeaway.select(1,2,3,5)}.to raise_error("Wrong total of items")
  end
  
end
