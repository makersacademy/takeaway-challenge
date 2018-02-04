require "order"

describe Order do

  let(:product_1) {double("Beef burger", number: 1, name: "Beef burger", price: 10, quantity: 1)}
  let(:product_2) {double("Cheese burger", number: 2, name: "Cheese burger", price: 12, quantity: 1)}
  let(:product_1_quantity_2) {double("Beef burger", number: 2, name: "Beef burger", price: 12, quantity: 2)}


  # TODO: Isolate tests by only testing the functionality in order
  # i.e. the product adding, can test the new product aspect is working in product itself
  it "Allows the customer to select a product" do
    allow(subject.product).to receive(:new).and_return(product_1)
    product_one = subject.select_product(1)
    expect(subject.current_order).to eql(product_one)
  end

  it "Allows the customer to select multiple products" do
    allow(subject.product).to receive(:new).and_return(product_1)
    subject.select_product(1)
    allow(subject.product).to receive(:new).and_return(product_2)
    subject.select_product(2)
    expect(subject.current_order).to eql([product_1, product_2])
  end

  it "Keeps track of the quantity of specific dishes" do
    # allow(subject.product).to receive(:new).and_return(product_1)
    # allow(product_1).to receive(:quantity_plus_one).and_return(:product_1_quantity_2)
    subject.select_product(1)
    subject.select_product(1)
    expect(subject.current_order.last.quantity).to eql 2
  end

end
