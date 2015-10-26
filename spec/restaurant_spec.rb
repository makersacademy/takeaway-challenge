require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new(:Italian) }

  it "there are available menus to choose from" do
    expect(described_class::MENUS).to_not be_empty
  end

  it "has a specific menu if initialized with argument" do
    expect(restaurant.menu).to eq described_class::MENUS[:Italian]
  end

end
