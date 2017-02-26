require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it { is_expected.to respond_to :view_dishes }

  it "displays a list of dishes with prices" do
    expect {menu.view_dishes}.to output("1. Tandoori Chicken: 3.50\n2. Lamb Madras: 4.00\n").to_stdout
  end

end
