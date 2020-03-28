require 'order'

describe Order do
  it "responds to #show_menu" do
    expect(subject).to respond_to :show_menu
  end

  # Need to think about the description here.
  # Is this test a bit silly, should it be updated?
  it "#show_menu prints the menu" do
    expect(subject.show_menu).to be_instance_of Array
  end

  it "responds to #add_pizza with a menu number" do
    expect(subject).to respond_to(:select_pizza).with(1).argument
  end

  #Again another instance where I am just asking if it's
  #an instance of a class rather than the contents
  it "#add_pizza returns the first item from #show_menu" do
    expect(subject.add_pizza("1")).to be_instance_of Hash
  end

  it "responds to #selection" do
    expect(subject).to respond_to :selection
  end
end
