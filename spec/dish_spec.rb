require 'dish'

describe Dish do

  subject {described_class.new("Pie", 5)}

  it "has a name" do
    expect(subject.details[:name]).to eq "Pie"
  end

  it "has a price" do
    expect(subject.details[:price]).to eq 5
  end

end