require 'menu'

describe Menu do
  it "displays a list of dishes with prices" do
    expect(subject.display_dishes).to eq("special_fried_rice: £3.50")
  end
end
