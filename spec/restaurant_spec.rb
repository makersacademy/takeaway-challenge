# require 'restaurant'
#
# describe Restaurant do
#
# subject(:restaurant) {described_class.new}
# let(:messager) {double(:messager)}
#
#
# describe 'confirm' do
#   before do
#     allow(restaurant).to receive(:confirm_order).with(15).and_return(messager.send("Thanks for your order. That's £#15"))
#   end
#   it 'sends a confirmation text' do
#     expect(subject.messager).to receive(:send).with "Thanks for your order. That's £15"
#     subject.confirm_order(15)
#   end
# end
#
# end
