require 'takeaway'

describe Takeaway do

  it 'prints a list of dishes' do
    #Need to make test more specific, to test what the output is
    expect { subject.show_menu }.to output.to_stdout
  end

  it 'adds an item and its quantity to an order' do
    subject.add_item("chicken tikka", 2)
    expect(subject.menu).to include([{ dish: "chicken tikka", quantity: 2 }])
  end

end
