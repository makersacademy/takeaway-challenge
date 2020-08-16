require 'order'

describe Order do
  it "Expects order to be an instance of Order class" do
    expect(subject).to be_an_instance_of(Order)
  end

  it "Expects order to respond to add_to_order" do
    expect(subject).to respond_to(:add_to_order)
  end
end
