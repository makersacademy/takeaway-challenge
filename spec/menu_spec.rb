require 'menu'

describe Menu do
  subject {described_class.new(menu: menu)}
  let(:menu) { double(:menu, print: displayed_dishes) }
  let(:displayed_dishes) { "special_fried_rice: £3.50" }

  it "displays a list of dishes with prices" do
    expect(subject.display_dishes).to eq(displayed_dishes)
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order


end
