require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'restaurant'

describe Restaurant do
  it "has a menu" do
    angry_chicken = described_class.new
    expect(angry_chicken.menu).to eq(
      "friendly chicken": 7.50,
      "angry chicken": 7.50,
      "furious chicken": 7.50,
      "angry beef burger": 11.0,
      "happy vegan burger": 9.00,
      "chips": 2.50
    )
  end

  xit "can send order-placed confirmation text message" do
  end
end
