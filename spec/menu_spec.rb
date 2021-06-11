require 'menu'

describe Menu do
  it "should contain a selection of dishes" do
    expect(subject.dishes).to be_a Hash
    expect(subject.dishes).not_to be_empty
  end
end