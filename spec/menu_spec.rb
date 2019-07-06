require 'menu'
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe Menu do
  subject(:menu) { described_class.new }
  it "a menu should be an instance of Menu class" do
    expect(menu).to be_instance_of(Menu)
  end
end
