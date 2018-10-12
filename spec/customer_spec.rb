require "customer"

describe Customer do

  it "requests a menu card" do
    expect(subject).to respond_to(:request_menu)
  end

end
