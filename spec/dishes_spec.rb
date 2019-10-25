require "dishes"

describe Dishes do
  let(:dishes) { Dishes.new }

  it "creates a instance of Dishes" do
    expect(dishes).to be_instance_of(Dishes)
  end
end
