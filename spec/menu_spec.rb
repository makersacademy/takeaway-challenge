require 'menu'

# list of dishes with prices shown to customer
describe Menu do
  subject(:menu) { described_class.new }
  it "a menu should be an instance of Menu class" do
    expect(menu).to be_instance_of(Menu)
  end
  
  it "should display the menu" do
    expect(menu).to respond_to(:view)
  end
end
