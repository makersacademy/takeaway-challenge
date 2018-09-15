require 'dish'

RSpec.describe Dish do

  subject { described_class.new("Spaghetti and Meatballs", 5) }

  it "has a name" do
    expect(subject.name).to eq "Spaghetti and Meatballs"
  end

  it "has a price" do
    expect(subject.price).to eq 5
  end
end
