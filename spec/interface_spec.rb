require 'interface'

describe Interface do

  before do
    @filepath = '/Users/malinnaleach/Programs/takeaway-challenge/lib/test.csv'
    @text = '/Users/malinnaleach/Programs/takeaway-challenge/lib/test.txt'
    @test_array = ["test"]
    @quantity = 2
    @cost = 10.50
    @price = 5.95
    @name = "Margherita"
    @input = ""
    allow(interface).to receive(:user_input) do
      @input.empty? ? @input = "1" : @input = ""
      @input
    end
    allow(interface).to receive(:quantity_input) {2}
    allow(interface).to receive(:input_request) {nil}
    allow(interface).to receive(:quantity_request) {nil}
    allow(order).to receive(:add) {order.order_array << order_line}
  end

  let(:dish) { double("Dish", name: @name, price: @price) }
  let(:order_line) { double("OrderLine", dish: dish, quantity: @quantity, cost: @cost) }
  let(:menu) { double("Menu", dishes: [dish])}
  let(:order) { double("Order", order_array: [])}

  subject(:interface) {described_class.new(@filepath)}

  it 'should be able to output text from file' do
    expect(STDOUT).to receive(:puts).with("Testing testing\n")
    interface.file_reader(@text)
  end

  it 'shoud be able to output text from an array' do
    expect(STDOUT).to receive(:puts).with("test")
    interface.display(@test_array)
  end

  it 'should build an order' do
    interface.build_order(menu, order)
    expect(order.order_array).to eq [order_line]
  end

end
