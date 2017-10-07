require 'ordering'
require 'menu'

describe Ordering do
  subject(:order) { described_class.new }

  it "doesn't allow the customer to order something not on the menu" do
    expect { order.selection('not on menu') }.to raise_error "Sorry that item isn't on the menu! Please choose from the menu."
  end

  it "allows the customer to select a dish on the menu" do
    order.selection('classic margherita')
    expect(order.selected_dishes).to include 'classic margherita'
  end

end
