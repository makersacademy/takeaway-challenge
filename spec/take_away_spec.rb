require 'take_away'

describe TakeAway do

  subject(:take_away) { described_class.new }

  it "has a hash of dishes" do
    expect(take_away.dishes).to be_a(Hash) 
  end
end
