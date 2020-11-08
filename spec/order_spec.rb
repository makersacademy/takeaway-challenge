require 'order'

describe Order do

  it "Is an instance of the order class" do
    expect(subject).to be_instance_of(Order)
  end

  it "Correctly adds an item to the order" do
    expect { subject.add_to_order("oreos", 1, 120) }.to change { subject.order.length }.by(1)
  end

  it "Stores the correct price in total" do
    subject.add_to_order("oreos", 2, 120)
    subject.add_to_order("milk", 1, 230)
    expect(subject.total).to eq(470)
  end

  it "Will not add a new entry to order if more of the same item is added" do
    subject.add_to_order("oreos", 1, 120)
    expect { subject.add_to_order("oreos", 1, 120) }.to change { subject.order.length }.by(0)
  end

  it "Increases quantity of item in order if more of the same is added" do
    subject.add_to_order("oreos", 1, 120)
    expect { subject.add_to_order("oreos", 1, 120) }.to change { subject.order[0][:qty] }.by(1)
  end

  it "Removes item from order if quantity reduced to 0" do
    subject.add_to_order("oreos", 1, 120)
    expect { subject.remove_from_order("oreos", 1) }.to change { subject.order.length }.by(-1)
  end

  it "Removes item from order if quantity reduced to below 0" do
    subject.add_to_order("oreos", 1, 120)
    expect { subject.remove_from_order("oreos", 2) }.to change { subject.order.length }.by(-1)
  end

  it "Correctly reduces the quantity of items" do
    subject.add_to_order("oreos", 2, 120)
    expect { subject.remove_from_order("oreos", 1) }.to change { subject.order[0][:qty] }.by(-1)
  end

  it "Prints to stdout when .print_order is called" do
    expect { subject.print_order }.to output.to_stdout
  end

end
