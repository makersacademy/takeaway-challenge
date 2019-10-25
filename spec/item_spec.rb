require 'rspec'

subject {Item.new}

describe Item do
    it "should create an empty Item object with name = nil" do
        expect(subject.name).to eq(nil)
    end
    it "should create an empty Item object with price = nil" do
        expect(subject.name).to eq(nil)
    end
end
