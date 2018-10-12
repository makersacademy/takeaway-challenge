require 'invoice'

describe Invoice do
  it 'creates an invoice for each order' do
    order_form = OrderForm.new
    order_form.add_to_order("muffin")
    order_form.add_to_order("cookie")
    invoice = Invoice.new(order_form.order)
    expect(invoice.total).to eq 5
  end
end
