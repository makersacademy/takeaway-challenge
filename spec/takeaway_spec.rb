require 'takeaway'

describe Takeaway do
  let(:restaurant) { double :restaurant }
  it "should display the menu" do
    allow(restaurant).to receive(:menu) { { Fish: 10 } }
    expect(subject.list_menu(restaurant)).to eq({ Fish: 10 })
  end
end
