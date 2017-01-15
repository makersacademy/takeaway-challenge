require "menu_item"
describe MenuItem do
  describe "#creation " do
    let(:test_hash) do
      {name:       "spring rolls",
      price:      500,
      description:"what ever is in em, i like it!"}
    end
    subject{described_class.new test_hash}
    context "passed a good hash" do
      it "should have a name" do
        expect(subject.name).to eq test_hash[:name]
      end
      it "should have a description" do
        expect(subject.description).to eq test_hash[:description]
      end
      it "should have a price" do
        expect(subject.price).to eq test_hash[:price]
      end
    end
    context "passed a bad hash" do
      it "should raise if passed a hash with no name" do
        hash = {price: 500}
        message = "name required to add menu_item"
        expect{described_class.new hash}.to raise_error message
      end
      it "should raise if passed a hash with no price" do
        name = "prawn toast"
        hash = {name: name}
        message = "price required for #{name}"
        expect{described_class.new hash}.to raise_error message
      end
    end
  end
end
