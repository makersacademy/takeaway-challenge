require "menu_item"
describe MenuItem do
  test_hash = {name: "spring rolls",
               price: 5,
               description: "what ever is in em, i like it!"}
  subject{described_class.new test_hash}
  describe "#creation "
  it "has a name" do
    expect(subject.name).to eq "spring rolls"
  end
  it "has a description" do
    expect(subject.description).to eq "what ever is in em, i like it!"
  end
  it "has a price" do
    expect(subject.price).to eq 5
  end
end
