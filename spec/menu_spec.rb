require 'menu'
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe Menu do
  subject(:menu) { described_class.new }
  it "a menu should be an instance of Menu class" do
    expect(menu).to be_instance_of(Menu)
  end
  it "gets the price of a dish" do
    expect(menu).to respond_to(:price).with(1).argument
  end
  it "should display the menu" do
    expect(menu).to respond_to(:view)
  end
end
