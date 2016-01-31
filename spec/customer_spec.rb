require 'customer'

describe Customer do

  let (:order) { double :order}
  let (:dish) { double :dish}
  let (:takeaway) { double :takeaway}
  subject(:customer){described_class.new 'Alex','+44 0958959595'}

  it "should be able to #choose_takeaway" do
    expect{customer.choose_takeawey(takeaway)}.not_to raise_error
  end

  before do
    customer.choose_takeawey(takeaway)
  end

  it "should be able to #make_order" do
    customer.make_order(order)
    expect(customer.order).to eq order
  end

  it "should be able to #add_to_order" do
    expect(takeaway).to receive(:order)
    customer.add_to_order(dish)
  end

  it "should be able to #remove_from_order" do
    expect(takeaway).to receive(:correct_order)
    customer.remove_from_order(dish)
  end

  it "should be able to checkout" do
    expect(takeaway).to receive(:complete_order)
    customer.checkout
  end

end
