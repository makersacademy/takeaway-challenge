require 'takeaway'

describe Takeaway do
  subject { Takeaway.new }
  let(:menu) { Menu.new }

  it "is expected to have a menu" do
    expect(subject.view_menu).to eq(menu.view_all)
  end

end
