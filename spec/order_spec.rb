require 'order'

describe Order do
  it_behaves_like ItemList

  let(:dish) { double(:dish, change_cost: 0, name: "Tuna", cost: 6, :+ => 6) }

  it 'adds multiple items' do
    expect { subject.add_order_items(dish, 5) }.to change { subject.items.count }.by(5)
  end

  it 'removes multiple items' do
    subject.add_order_items(dish, 5)
    expect { subject.remove_order_items(dish, 4) }.to change { subject.items.count }.by(-4)
    expect(subject.items).to eq([dish])
  end

  it 'calculates a total' do
    subject.add_order_items(dish, 5)
    expect(subject.total).to eq(5 * 6)
  end

  it 'outputs the display to std out' do
    small_dish = double(:small_dish,name: "A",cost:5)
    subject.add_order_items(small_dish,1)
    test_output =  "- Current Order -------------------------------------\n"
    test_output << " Dish Name            |    Price | Amount |    Total \n"
    test_output << "-----------------------------------------------------\n"
    test_output << " A                    |    £5.00 |      1 |    £5.00 \n"
    test_output << "-----------------------------------------------------\n"
    test_output << " Total Cost:                                   £5.00 \n"
    test_output << "-----------------------------------------------------\n"
    expect { subject.display }.to output(test_output).to_stdout
    expect(subject.display).to eq(nil)
  end

end
