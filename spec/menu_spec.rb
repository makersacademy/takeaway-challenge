require 'menu'

describe Menu do
  it "can add items to the menu" do
    subject.add_to_menu("spicy tofu", 7.95)
    expect(subject.dishes).to include("spicy tofu")
  end

  it "can remove items from the menu" do
    subject.remove_from_menu("chilli squid")
    expect(subject.dishes).not_to include("chilli squid")
  end
end