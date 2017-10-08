require 'ordering'
require 'menu'

describe Ordering do
  subject(:order) { described_class.new }
  let(:selection) { double :selection }
  let(:selected_dishes) { double :selected_dishes }

  it "doesn't allow the customer to order something not on the menu" do
    expect { order.selection('not on menu') }.to raise_error "Sorry that item isn't on the menu! Please choose from the menu."
  end

  it "allows the customer to select a dish on the menu" do
    order.selection('classic margherita')
    expect(order.selected_dishes).to include 'classic margherita'
  end

  it "allows the customer to select several dishes from the menu" do
    order.selection('classic margherita', 2)
    expect(order.selected_dishes).to include "classic margherita", "classic margherita"
  end

  it "allows the customer to check how many dishes they have ordered" do
    order.selection('pepperoni', 4)
    expect(order.view_dishes).to eq "You have ordered 4 dishes."
  end

end
