require "print_menu"

describe PrintMenu do

  let(:menu_printer) { PrintMenu }
  let(:takeaway_menu) { double :takeaway_menu }
  let(:szechuan_chilli_beef) { double :TakeawayDish }
  let(:szechuan_chilli_chicken) { double :TakeawayDish }
  let(:kung_po_chicken) { double :TakeawayDish }
  let(:vegetable_spring_rolls) { double :TakeawayDish }
  let(:takeaway_dishes) { [szechuan_chilli_beef, szechuan_chilli_chicken, kung_po_chicken, vegetable_spring_rolls] }

  describe "#print_menu" do
    before(:each) do
      allow(takeaway_menu).to receive(:takeaway_dishes) { takeaway_dishes }
      allow(szechuan_chilli_beef).to receive(:name) { "Szechuan Chilli Beef" }
      allow(szechuan_chilli_beef).to receive(:price) { 6.50 }
      allow(szechuan_chilli_chicken).to receive(:name) { "Szechuan Chilli Chicken" }
      allow(szechuan_chilli_chicken).to receive(:price) { 6.50 }
      allow(kung_po_chicken).to receive(:name) { "Kung Po Chicken" }
      allow(kung_po_chicken).to receive(:price) { 5.50 }
      allow(vegetable_spring_rolls).to receive(:name) { "Vegetable Spring Rolls" }
      allow(vegetable_spring_rolls).to receive(:price) { 3 }
    end

    it "creates a string to print out" do
      expect { menu_printer.print_menu(takeaway_menu.takeaway_dishes) }.to output.to_stdout
    end

    it "places the array items in a string listed from 1..n" do
      expect { menu_printer.print_menu(takeaway_menu.takeaway_dishes) }.to output("1. #{szechuan_chilli_beef.name} #{szechuan_chilli_beef.price}\n2. #{szechuan_chilli_chicken.name} #{szechuan_chilli_chicken.price}\n3. #{kung_po_chicken.name} #{kung_po_chicken.price}\n4. #{vegetable_spring_rolls.name} #{vegetable_spring_rolls.price}").to_stdout
    end
  end
end
