require 'order'
require 'menu'
require 'confirm_order'

describe Order do
  let(:order) { Order.new }
  let(:menu) { Menu.new }

  # instance variables:
  it { is_expected.to respond_to(:order_list, :total) }
  # methods:
  it { is_expected.to respond_to(:select_dish, :print_order_list, :print_menu, :order_item, :select_quantity, :add_to_order, :another_dish?, :confirm_order? ) }
  
  describe '#initialize' do
    it "order list is expected to be empty at the start" do
      expect(order.order_list).to be_empty       
    end
  end
  
  describe '#print_menu' do
    it "prints the menu to see what's on offer" do
      expect(order.print_menu).to eq puts menu.print_menu
    end
  end

 describe '#select_dish' do
   it "lets the user order an item from the menu" do
    allow_any_instance_of(Object).to receive(:gets).and_return("Chai\n")
    expect(order.select_dish).to eq "Chai"
   end
 end

 describe '#select_quantity' do
   it "lets user select the quantity of item to order" do
    allow_any_instance_of(Object).to receive(:gets).and_return("2\n")
    dish = "Chai"
    expect(order.select_quantity(dish)).to eq 2
   end
 end

 describe '#add_to_order' do
   it "adds the users order to the order list" do
     dish, quantity = "Chai", 2
     order.add_to_order(dish,quantity)
     expect(order.order_list).to eq ["Chai","Chai"]
   end
 end

 describe '#another_dish?' do
  it "lets the user decide not to select another item" do
   allow_any_instance_of(Object).to receive(:gets).and_return("n\n")
   expect(order.another_dish?).to eq nil
  end
 end

 describe '#print_order_list' do
  let(:order_list) { "yum yum food" }
  it "prints the order list" do
    order.order_list << order_list
    expect(order.print_order_list).to eq puts order_list
  end
end

describe '#confirm_order?' do
  it "lets the user choose not to confirm their order" do
   allow_any_instance_of(Object).to receive(:gets).and_return("n\n")
   expect(order.confirm_order?).to eq nil
  end
 end



end
