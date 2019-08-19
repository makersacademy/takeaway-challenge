require 'basket'
require 'formatter'

describe Basket do
  let(:order) { double(:order, name: 'Foo soup', price: 2, quantity: 1) }
  it 'can add a new order' do
    subject.add(order, 1)
    expect(subject.empty?).to be(false)
  end
  it 'can add to the quantity of an existing order' do
    subject.add(order, 1)
    allow(order).to receive(:quantity=).and_return(1)
    another_order = double(:another_order, name: 'Foo soup', quantity: 1)
    subject.add(another_order, 1)
    expect(subject.empty?).to be(false)
  end
  it 'can empty itself' do
    subject.add(order, 1)
    subject.empty
    expect(subject.empty?).to be(true)
  end
  it 'provides a subtotal price' do
    subject.add(order, 1)
    another_order = double(:another_order, name: 'Bar mulch', price: 1, quantity: 1)
    subject.add(another_order, 1)
    expect(subject.total).to eq(3)
  end
  it 'can print its total' do
    subject.add(order, 1)
    expect { subject.print_total }.to output("Total: £2.00\n").to_stdout
  end
  it 'can list its contents' do
    subject.add(order, 1)
    another_order = double(:another_order, name: 'Bar mulch', price: 1, quantity: 1)
    subject.add(another_order, 1)
    expect { subject.list }.to output("Foo soup x1: £2.00\nBar mulch x1: £1.00\n").to_stdout
  end
end
