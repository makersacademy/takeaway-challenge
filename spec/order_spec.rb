# require 'order'
# require 'takeaway'
#
# describe Order do
#
#   it "initializes with an empty order" do
#     expect(subject.basket).to be_empty
#   end
#
#   let(:takeaway) { Takeaway.new }
#
#   it "summarizes the order" do
#     takeaway.place_order("pizza", 3)
#     takeaway.place_order("burger")
#     expect(takeaway.order.summary).to eq "pizza x3 = £14.97, burger x1 = £9.99"
#   end
# end
