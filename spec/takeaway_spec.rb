require 'takeaway'

describe Takeaway do

  it "is expected to have a menu" do

    expect(subject).to receive(:see_menu).and_return(Menu.new)
  end

end
