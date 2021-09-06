require 'dish'

describe Dish do

  context "should list dishes with prices" 
  it "responds to the list method" do
    expect(subject).to respond_to :list_items
  end
  it "is a hash" do
    test_list = subject.list_items
    expect(test_list.is_a?(Hash)).to be_truthy
  end
  it "includes items" do
    expect(subject.list_items).to include :pizza
  end
  it "includes prices" do
    expect(subject.list_items).to include :tiramisu => '£4.20'
  end

  context "should select some number of dishes"
  it "responds to the select_dishes method" do
    expect(subject).to respond_to :select_dishes
  end
  it "should allow user to select certain number of dishes" do
    expect(subject.select_dishes(:lasagne, 4)).to eq({ :lasagne => 4 })
  end
end



# it "select number of dishes" do
#   selected_dishes = subject.select_dishes(:lasagne)
#   expect(selected_dishes).to include ":lasagne => '£7,80'"
# end