require 'order'

describe Order do
  include_examples 'menu'

  it "can add a dish" do
    subject.add_dish(:pizza, 1)
    expect(subject.dishes).to include(:pizza)
  end

  it "it adds specified number of dishes" do
    subject.add_dish(:pizza, 2)
    expect(subject.dishes[:pizza]).to eq(2)
  end

  it "if dish was added again, increases by additional number" do
    subject.add_dish(:pizza, 1)
    subject.add_dish(:pizza, 2)
    expect(subject.dishes[:pizza]).to eq(3)
  end

  it "knows total price" do
    subject.add_dish(:pizza, 2)
    subject.add_dish(:nachos, 1)
    expect(subject.total).to eq(29.97)
  end

  it "empty when initialized" do
    expect(subject).to be_empty
  end

  it "is not empty if dish added" do
    subject.add_dish(:pizza, 2)
    expect(subject).not_to be_empty
  end

end