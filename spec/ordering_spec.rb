require 'ordering'
require 'menu'
require 'twilio-ruby'

describe Ordering do
  subject(:order) { described_class.new }
  let(:selection) { double :selection }
  let(:selected_dishes) { double :selected_dishes }

  it "doesn't allow the customer to order something not on the menu" do
    expect { order.selection('not on menu') }.to raise_error "Sorry that item isn't on the menu! Please choose from the menu."
  end

  it "allows the customer to select a dish on the menu" do
    order.selection('classic margherita')
    expect(order.selected_dishes).to include "1.classic margherita" => 8.5
  end

  it "allows the customer to select several dishes from the menu" do
    order.selection('classic margherita', 2)
    expect(order.selected_dishes).to include "1.classic margherita" => 8.5, "1.classic margherita" => 8.5
  end

  it "allows the customer to check how many dishes they have ordered" do
    order.selection('pepperoni', 4)
    expect(order.view_order).to eq "You have ordered 4 dishes."
  end

  it "calculates the total cost of the order" do
    order.selection('pepperoni', 2)
    expect(order.calculate_cost).to eq "Total: £19.9"
  end

end
