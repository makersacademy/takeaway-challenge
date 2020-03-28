require 'order'

describe Order do
  it "responds to #show_menu" do
    expect(subject).to respond_to :show_menu
  end

  # Need to think about the description here.
  it "#show_menu prints the menu" do
    expect(subject.show_menu).to be_instance_of Array
  end
end
