require "checkout"


describe Checkout do

  context "Allows the user to review and complete the order"

  #let (:checkout){CHeckout.new(:takeaway)

  it "should respond to view basket" do
    expect(subject).to respond_to(:view_basket)
  end

  xit "should return a list of the final basket" do
    expect(subject.view_basket(:order)).to be_an(Array)
  end

  it "should respond to pay" do
    expect(subject).to respond_to(:pay)
  end

  it "should allow the user to set the order" do
    expect(subject).to respond_to(:set_order)
  end

end
