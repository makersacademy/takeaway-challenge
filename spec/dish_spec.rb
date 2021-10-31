require 'dish'

describe Dish do 
  subject { described_class.new('cake', 1) }

  it "lists of dishes with prices" do
    expect(subject.name).to eq 'cake'
  end
end