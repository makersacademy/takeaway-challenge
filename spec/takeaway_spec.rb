require "takeaway"

describe Takeaway do
  let(:takeaway) { described_class.new }

  it { expect(takeaway).to respond_to :show_menu }

  it "should print the menu" do
    expect(takeaway.show_menu).to eq Takeaway::MENU
  end
  
end
