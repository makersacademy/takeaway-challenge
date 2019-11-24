require 'takeaway'

describe Takeaway do

  it "has a menu" do
    expect(subject.show_menu).not_to be_empty
  end
  
end
