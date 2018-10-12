require 'takeaway'

describe Takeaway do
  it "checks for existance of Takeaway class" do
  expect(subject).to be_instance_of(Takeaway)
  end
  it "creates the menu" do
    expect(subject.c_menu).not_to eq nil
  end
  it "calls the menu" do
    subject.c_menu
    expect(subject.l_menu).not_to eq nil
    # expect(subject.l_menu)to eq (string && float)
  end



end
