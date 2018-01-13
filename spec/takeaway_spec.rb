require './docs/takeaway.rb'

describe TakeAway do

  context '#select_dish' do
    subject(:takeaway_class)        { described_class.new(menu_class) }
    let(:menu_class)                { double :menu_class, new: menu }
    let(:menu)                      { [{ dish: "Enchanted Sauce", price: 12 }] }
    let(:dish_name)                 { 'Enchanted Sauce' }

    it "Should send request to menu" do
      allow(menu_class).to receive(:find_dish).and_return(menu)
      expect(menu_class).to receive(:find_dish).with(dish_name)
      takeaway_class.select_dish(dish_name)
    end

    it "Should add order to order final" do
      allow(menu_class).to receive(:find_dish).and_return(menu)
      takeaway_class.select_dish(dish_name)
      expect(takeaway_class.order_final).to eq(menu)

    end
  end

  context '#see_menu' do
    subject(:takeaway_class)        { described_class.new(menu_class) }
    let(:menu_class)                { double :menu_class, new: menu }
    let(:menu)                      { [{ dish: "Enchanted Sauce", price: 12 }] }

    it "Should print menu with header" do
      allow(menu_class).to receive(:print_menu).and_return(menu)
      expect(takeaway_class.see_menu).to eq(menu)
    end
  end

  context '#order_list' do
    subject(:takeaway_class)        { described_class.new(menu_class) }
    let(:menu_class)                { double :menu_class, new: menu }
    let(:menu)                      { [{ dish: "Enchanted Sauce", price: 12 }] }
    let(:dish_name)                 { 'Enchanted Sauce' }
    let(:output_double)             { "Your order:\n----------------\nEnchanted Sauce --- £12\n----------------\nTotal payable --- 12\n" }

    it "Should print a list of the order" do
      allow(menu_class).to receive(:find_dish).and_return(menu)
      takeaway_class.select_dish(menu)
      expect { takeaway_class.order_list }.to output(output_double).to_stdout
    end
  end

  context '#bill' do
    subject(:takeaway_class)        { described_class.new(menu_class) }
    let(:menu_class)                { double :menu_class, new: menu }
    let(:menu)                      { [{ dish: "Enchanted Sauce", price: 12 }] }
    let(:dish_name)                 { 'Enchanted Sauce' }

    it "Should print out total cost of order" do
      allow(menu_class).to receive(:find_dish).and_return(menu)
      takeaway_class.select_dish(dish_name)
      expect(takeaway_class.bill).to eq(12)
    end
  end

  context '#complete_order' do
    subject(:takeaway_class)        { described_class.new }

    it "Should complete order with a text msg" do
      expect(takeaway_class).to receive(:complete_order)
      takeaway_class.complete_order
    end
  end
end
