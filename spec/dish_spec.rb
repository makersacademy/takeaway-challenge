require 'dish'

describe Dish do
  subject { described_class.new(:name, :price, :prep_time) }
  let(:name) { "Katsu Chicken Curry" }
  let(:price) { 7.99 }
  let(:prep_time) { 20 }
  
  it "should store the name of the dish" do
    expect(subject.name).to eq(:name)
  end

  it "should store the price of the dish" do
    expect(subject.price).to eq(:price)
  end

  it "should store the preparation time of the dish" do
    expect(subject.prep_time).to eq(:prep_time)
  end

end
