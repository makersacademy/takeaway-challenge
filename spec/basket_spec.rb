require "basket"

describe Basket do

  it "recognises ability to call cart" do
    expect(subject).to respond_to(:add_to_cart)
  end

  
end
