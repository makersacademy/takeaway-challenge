
require 'menuprinter'
require 'takeaway'
require 'basket'
require 'message_sender'

describe "Takeaway feature" do
  let(:items) { [ {name: "Chips", price: 2}, {name: "Curry", price: 3.25 } ] }
  let(:selection) { [ { name: "Chips", quantity: 1}, { name: "Curry", quantity: 3 } ] }
  let(:takeaway) { Takeaway.new(items) }
  let(:order_summary) { "Chips * 1, price = £2.00\nCurry * 3, price = £9.75\nTotal price = £11.75\nWould you like to proceed?" }
  it "shows formatted list of items to user" do
    expect { takeaway.show_items }.to output("1. Chips: £2.00\n2. Curry: £3.25").to_stdout
  end

  # it "allows users to make a selection see their invoice and ask to confirm" do
  #   stub_const("MessageSender::Client", FakeSMS)
  #   allow($stdin).to receive(:gets).and_return('Yes')
  #   expect { takeaway.make_selection({ chips: 1, curry: 3 }) }.to output(order_summary).to_stdout
  # end

  it "allows users to not continue with order" do
    allow($stdin).to receive(:gets).and_return('No')
    expect { takeaway.make_selection(selection) }.to output(order_summary + "\nYour order has not been placed").to_stdout
  end
end
