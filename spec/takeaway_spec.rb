require 'takeaway.rb'

describe Takeaway do
  takeaway = Takeaway.new
  it "responds to the method show_menu" do
    expect(takeaway).to respond_to(:show_menu)
  end

  it "shows the menu when passed method show_menu" do
    expect(takeaway.show_menu).to be_a(Hash)
  end

  it "responds to the method add" do
    expect(takeaway).to respond_to(:add)
  end

  it "responds to the method add with one argument" do
    expect(takeaway).to respond_to(:add).with(1).argument
  end

  it "adds item selected to basket" do
    expect(takeaway.add("spring roll")).to have_key(:"spring roll")
  end
end
