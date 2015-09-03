require 'menu'

describe Menu do
  it "is a hash" do
    expect(subject.display).to be_a Hash
  end
  it "can display dishes" do
    expect(subject.display).to include "hamburger"
  end

end
