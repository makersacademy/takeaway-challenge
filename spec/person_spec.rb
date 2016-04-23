require 'person'

describe Person do
  subject(:person) {described_class.new(name: "Pepe Gotera", phone: "+441234567890")}
  it "respond to an attribute name" do
    expect(person).to respond_to(:name)
  end

  it "responds to an attribute phone" do
    expect(person).to respond_to(:phone)
  end
end