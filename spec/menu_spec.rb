require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  it "menu.print returns a list of dishes and prices" do
    expect(menu.show).to be_a(String)
  end
end
