require 'menu'

describe Menu do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "displays a list of dishes with prices" do
    expect(subject.display_dishes).to eq("special_fried_rice")
  end
end
