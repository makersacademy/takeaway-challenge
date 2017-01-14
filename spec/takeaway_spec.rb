require 'takeaway'


describe Takeaway do

  subject(:takeaway) { described_class.new}
  let(:menu) { double :menu, starter: {"seaweed" => 1.20} }

  it " shows the list of dishes with prices" do
    allow(takeaway).to receive(:show_menu).and_return({"seaweed" => 1.20})
    expect(takeaway.show_menu).to eq(menu.starter)
  end


end
