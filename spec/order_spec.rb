require 'order'

describe Order do

  subject(:mainmenu) { described_class.new }
  let(:user_input) { "Test" }

  it "confirms the order" do
    expect(subject.place_an_order).to eq(nil)
  end

  it "gets user input" do
    expect(subject.order_intro).to eq("")
  end

# order_loop
#
# order_selection
#
# order_amount
#
# order_amount_added_to_array
#
# final_order_process

  it "confirms the order" do
    expect(subject.order_confirmation).to eq(nil)
  end

end
