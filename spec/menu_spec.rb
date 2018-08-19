require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

describe "#print_menu" do
  it "should print the menu" do
    expect(menu).to respond_to(:print_menu)
  end
end

end
