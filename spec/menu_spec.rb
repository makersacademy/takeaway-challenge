require "menu"

describe Menu do

  let (:menu_items) {double :menu_items}

  it "checks that the menu has items" do
    expect(subject.view_menu).not_to be_empty
  end

  # it "checks that new dishes are added to the menu" do
  #   expect(subject).to respond_to(:add_dish).with(1).argument
  # end
  #
  # it "checks that new dishes are added to the menu hash" do
  #   expect(subject.add_dish(:dish)).to change(:menu).by :dish
  # end
end
