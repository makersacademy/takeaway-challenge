require "menu"

RSpec.describe Menu do
  it "returns a list of dishes and prices"   do
    expect(subject.list).to be_a(Hash)
  end
end
