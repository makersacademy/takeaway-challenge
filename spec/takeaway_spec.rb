require 'takeaway'

describe Takeaway do
  it "should initialize with a hash menu" do
    expect(subject.menu.dishes).to be_a Hash
  end

  it "should print dishes on show_menu" do
    expect { subject.show_menu }.to output(puts(subject.menu.dishes)).to_stdout
  end
end
