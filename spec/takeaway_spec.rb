require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  subject(:takeaway) { Takeaway.new(menu) }

  it "should return a menu object when view_menu method is called" do
    expect(takeaway.view_menu).to eq menu
  end
end
