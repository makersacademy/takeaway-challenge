require 'customer'

describe Customer do
  subject(:customer) {described_class.new(name: "Sergio", phone: "+44")}
  it "respond to an attribute name" do
    expect(customer).to respond_to(:name)
  end

  it "responds to an attribute phone" do
    expect(customer).to respond_to(:phone)
  end
end