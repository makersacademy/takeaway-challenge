require 'takeaway'

describe Takeaway do

  it 'prints a list of dishes' do
    # Need to make test more specific, to test what the output is
    expect { subject.show_menu }.to output.to_stdout
  end

  it 'adds an item and its quantity to an order' do
    subject.add_item("chicken tikka", 2)
    expect(subject.instance_variable_get(:@order).selection).to include({ dish: "chicken tikka", quantity: 2 })
  end

  context 'adding several items to order' do
    tk = Takeaway.new
    tk.add_item("chicken tikka", 2)
    tk.add_item("beef madras", 1)

    it 'raises an error if the given total does not match order total' do
      expect { tk.place_order_with_total(25) }.to raise_error("Total is incorrect, please try again")
    end

  end

end
