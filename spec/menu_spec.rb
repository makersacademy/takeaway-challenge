require 'menu'

describe Menu do
  it "should contain dishes in a hash" do
    expect(subject.dishes).to be_a Hash
    expect(subject.dishes).not_to be_empty
  end
end
