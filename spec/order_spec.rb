require 'order'

describe Order do

  it 'displays a list of available dishes' do
    expect{subject.print_menu}.to output(/Miso Soup £3.5/).to_stdout_from_any_process
  end

  it 'stores input from user of the selected items' do
    subject.add_to_order("Miso Soup", 3)
    expect(subject.current_order).to include({"Miso Soup" => 3})
  end

  it 'does not take not existing items' do
    subject.add_to_order("I DONT EXIST", 3)
    expect(subject.current_order).not_to include({"I DONT EXIST" => 3})
  end

  it 'calculates total' do
    subject.add_to_order("Miso Soup", 2)
    subject.add_to_order("Chef Special Miso", 1)
    expect(subject.calculate_total).to eq(11.5)
  end


end
