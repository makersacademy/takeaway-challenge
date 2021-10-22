require 'customer'

describe Customer do

  it 'creates a new menu in the current menu list' do
    expect(subject.see_menu).to eq(subject.current_menu)
  end

#check customer can use add and remove items from menu
  it { is_expected.to respond_to(:add_item).with(2).argument }

  it { is_expected.to respond_to(:remove_item).with(1).argument }

  it 'Creates an empty customer order' do
    expect(subject.current_order).to eq([])
    end

  it 'can add items to the current order' do
    subject.add_item("Cod", 1)
    expect(subject.current_order).to include(["Cod",1])
  end

  it 'can remove items from the current order' do
    subject.add_item("Cod", 1)
    subject.remove_item("Cod")
    expect(subject.current_order).to eq([])
  end

  it 'can add quantities of items to an order' do
    subject.add_item("Cod",2)
    expect(subject.quantity).to eq(2)
  end

  # it 'counts the items in the order' do
  #   subject.add_item("Cod",2)
  #   subject.add_item("Chips",2)
  # end

end