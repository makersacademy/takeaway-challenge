describe 'Features' do
  # let(:client) {TwilioClient.new}
  # let(:order_item_one) {OrderItem.new(name: "Pepperoni", quantity: 1)}
  # let(:order_item_two) {OrderItem.new(name: "Ham & Pineapple", quantity: 2)}
  # let(:customer) {Customer.new(name: ENV['CUST_NAME'], method: client, identification: ENV['CUST_NUM'])}
  # let(:menu) {Menu.new(Dish)}
  # let(:order) {Order.new(customer)}
  # let(:bill) {Bill.new(menu)}
  # let(:item_one) {double :item_one, name: "Pepperoni", price: 5}
  # let(:item_two) {double :item_two, name: "Ham & Pineapple", price: 3}
  # describe 'A customer visits' do
  #
  #   before do
  #     menu.clear_items
  #     menu.add(item_one)
  #     menu.add(item_two)
  #     order.add(order_item_one)
  #     order.add(order_item_two)
  #   end
  #
  #   it 'and provides their details' do
  #     expect(customer.name).to eq ENV['CUST_NAME']
  #     expect(customer.method).to eq client
  #     expect(customer.identification).to eq ENV['CUST_NUM']
  #   end
  #
  #   it 'and views the menu' do
  #     menu.print_menu
  #   end
  #
  #   it 'and decides to add an item to their order' do
  #     expect(order.items).to include order_item_one
  #     expect(order.items).to include order_item_two
  #   end
  #
  #   it 'and wants to know the cost of the order' do
  #     expect(order.total(bill)).to eq 11
  #   end
  #
  #   it 'and wants to place the order' do
  #     expect{order.send}.to change{order.complete?}.to true
  #   end
  # end

end
