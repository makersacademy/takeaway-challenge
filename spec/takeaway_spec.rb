require 'takeaway.rb'

describe Takeaway do
  it "responds to the method show_menu" do
    expect(Takeaway.new).to respond_to(:show_menu)
  end

  it "shows the menu when passed method show_menu" do
    takeaway = Takeaway.new
    expect(takeaway.show_menu).to be_a Hash
  end
end
