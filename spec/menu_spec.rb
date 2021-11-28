require 'menu'

describe Menu do
  it "should be able to create and instance of Menu" do
    expect(Menu).to respond_to(:new)
  end

  subject(:menu) { described_class.new }
  let(:print_menu) { "Margherita Pizza: £8" }
  it "can print menu" do
     expect(menu.print_menu).to eq(menu.menu)
  end
end
