require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new }

  it "stores a new menu object" do
    expect(restaurant.menu).to be_an_instance_of(Menu)
  end

end
