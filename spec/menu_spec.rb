require 'menu'

describe Menu do
  it "can add items to the menu" do
    subject.add_to_menu("spicy tofu", 7.95)
    expect(subject.menu).to include("spicy tofu")
  end
end