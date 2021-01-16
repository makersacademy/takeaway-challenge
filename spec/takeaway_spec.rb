require 'takeaway'

describe Takeaway do
  it {is_expected.to respond_to(:show_menu)}

  it "should have a menu" do
    expect(subject.menu).not_to be_empty
  end
end
