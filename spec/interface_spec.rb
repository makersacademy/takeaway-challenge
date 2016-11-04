# require "interface.rb"
#
# describe Interface do
#
#   let(:menu) {double(:menu)}
#   let(:order_class) {double(:order_class, new: order_instance)}
#   let(:order_instance) {double(:order, add_to_order: nil, review_order: nil, checkout: nil)}
#   let(:adapter) { double(:adapter, send_sms: nil, get_inbound_messages: ["+123", "Taco-4"], update_messages: nil) }
#
#   let (:options_hash) {{menu: menu, order: order_class, adapter: adapter}}
#   subject(:interface) {described_class.new(options_hash)}
#
#   before do
#     allow(STDOUT).to receive (:puts)
#   end
#
#   context "Initialize" do
#     it "Saves a menu when initialized" do
#       expect(interface.instance_variable_get(:@menu)).to eq menu
#     end
#   end
#
#   it "Saves the order class when initialized" do
#     expect(interface.instance_variable_get(:@order_class)).to eq order_class
#   end
#
#   it "Does not have a current order when initialized" do
#     expect(interface.instance_variable_get(:@current_order)).to be_nil
#   end
# end
#
# context "moves to the Menu class" do
#   it "Tells the Menu to print menu"  do
#     expect(@menu).to receive (:show_menu)
#     # interface.show_menu
#   end
# end
#
# context "Beginning an order" do
#   describe "#new_order" do
#     before do
#       interface.new_order
#     end
#   end
#
#   # it "sends the menu to the order instance" do
#   #   expect(order_class).to have_received(:new).with(menu)
#   # end
#
#   it "saves the new order" do
#     expect(interface.instance_variable_get(:@current_order)).to eq order_instance
#   end
# end
#
# describe "#order" do
#   it "Rasies an error if there is no open order" do
#     expect{interface.order("Taco")}.to raise_error "Please begin your order"
#   end
#
#   it "Delegates ordering only one item to the order class" do
#     interface.new_order
#     interface.order("Taco")
#     expect(order_instance).to have_received(:add_to_order).with("Taco", 1)
#   end
#
#   it "Delegates ordering multiple items to the order class" do
#     interface.new_order
#     interface.order("Taco", 3)
#     expect(order_instance).to have_received(:add_to_order).with("Taco", 3)
#   end
# end
#
# describe "#review_order" do
#   before do
#     interface.new_order
#     interface.order("Taco", 3)
#   end
#
#   it "Delegates reviewing the order to the order instance" do
#     interface.review_order
#     expect(order_instance).to have_received(:review_order)
#   end
#
#   describe "#checkout" do
#     before do
#       interface.new_order
#       interface.order("Taco", 3)
#       interface.checkout(3.00)
#     end
#
#     it "Delegates completing an order to the order instance" do
#       expect(order_instance).to have_received(:checkout)
#     end
#
#     it "Places the current order back to nil" do
#       expect(interface.instance_variable_get(:@current_order)).to be_nil
#     end
#   end
# end
#
# context "Filling mobile orders" do
#   describe "#check_mobile_orders" do
#     before do
#       interface.check_mobile_orders
#     end
#
#     it "Gets valid orders from adapter" do
#       expect(adapter).to have_received(:get_inbound_messages)
#     end
#
#     it "Resents the current_order" do
#       expect(interface.instance_variable_get(:@current_order)).to be_nil
#     end
#
#     it "Delegates teh message updated to the adapter" do
#       expect(adapter).to have_received(:update_messages)
#     end
#
#     specify { expect {interface.check_mobile_orders}.to output.to_stdout}
#   end
# end
