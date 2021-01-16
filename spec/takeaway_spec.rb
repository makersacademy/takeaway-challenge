require 'takeaway'

describe Takeaway do
  it { is_expected.to respond_to(:show_menu) }

  it "should initialize with a hash menu" do
    expect(subject.menu.dishes).to be_a Hash
  end
  let (:menu) { double :menu }
  it "should print dishes on show_menu" do

    expect { subject.show_menu }.to output(:menu).to_stdout
  end
end
