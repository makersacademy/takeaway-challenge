require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it "prints a list of dishes with prices" do
    expect(menu.print_menu(menu)).to eq(menu)
  end

end
