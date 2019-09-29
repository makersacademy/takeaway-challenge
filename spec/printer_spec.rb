require 'printer'
dish_menu = [
  "Here's the menu, please enter which items you'd like:",
  "1.  Copius Fried Wild Greens       💎  3",
  "2.  Spicy Sauteed Peppers          💎  3",
  "3.  Copius Mushroom Skewers        💎  5",
  "4.  Vegetable Omlette              💎  6",
  "5.  Fried Egg and Rice             💎  5",
  "6.  Monster Curry                  💎  6",
  "7.  Mushroom Risotto               💎  5",
  "8.  Creamy Heart Soup              💎  8",
]
main_menu = [
  "1.  Review Order",
  "2.  Add Items to Order",
  "3.  Check Total",
  "4.  Submit Order",
  "Please make a selection:"
]

describe Printer do
  let(:dish1) { double("Dish1", name: "Copius Fried Wild Greens", cost: 3) }
  let(:dish2) { double("Dish2", name: "Spicy Sauteed Peppers", cost: 3) }
  let(:dish3) { double("Dish3", name: "Copius Mushroom Skewers", cost: 5) }
  let(:dish4) { double("Dish4", name: "Vegetable Omlette", cost: 6) }
  let(:dish5) { double("Dish5", name: "Fried Egg and Rice", cost: 5) }
  let(:dish6) { double("Dish6", name: "Monster Curry", cost: 6) }
  let(:dish7) { double("Dish7", name: "Mushroom Risotto", cost: 5) }
  let(:dish8) { double("Dish8", name: "Creamy Heart Soup", cost: 8) }
  let(:stdout) { double("STDOUT") }

  subject(:printer) { described_class.new(stdout) }

  describe '#print_welcome' do
    it 'prints the welcome message' do
      expect(stdout).to receive(:puts).with("Welcome to Link's Wild Delivery!")
      subject.print_welcome
    end
  end

  describe '#print_confirmation' do
    it 'prints confirms dish added to order message' do
      expect(stdout).to receive(:puts).with("Added to order.")
      expect(stdout).to receive(:puts).with("Anything else? Enter to finish adding items.")
      subject.print_confirmation      
    end
  end

  describe '#print_exit' do
    it 'prints the exit message' do
      expect(stdout).to receive(:puts).with("Sorry to see you go! Come back soon!")
      subject.print_exit
    end
  end

  describe '#print_order_submission' do
    it 'prints the submission message' do
      expect(stdout).to receive(:puts).with("Thanks, your order has been submitted!")
      expect(stdout).to receive(:puts).with("You should receive an SMS with delivery information shortly")
      subject.print_order_submission
    end
  end

  describe '#print_invalid_selection' do
    it 'prints a message' do
      expect(stdout).to receive(:puts).with('Invalid selection, try again or Enter to finish.')
      subject.print_invalid_selection
    end
  end

  describe '#print_checked_total' do
    context 'when correct' do
      it 'prints a message' do
        expect(stdout).to receive(:puts).with("Order total confirmed correct.")
        printer.print_checked_total(:correct)
      end
    end

    context 'when incorrect' do
      it 'prints a message' do
        expect(stdout).to receive(:puts).with("Total incorrect! Something went wrong, please start again")
        printer.print_checked_total(:incorrect)
      end
    end

    context 'when order empty' do
      it 'prints a message' do
        expect(stdout).to receive(:puts).with("Order empty, choose option 2 to add dishes to your order")
        printer.print_checked_total(:empty)
      end
    end
  end

  describe '#print_main_menu' do
    context 'given a list' do
      it 'prints a formatted numbered list' do
        list = [
          "Review Order",
          "Add Items to Order",
          "Check Total",
          "Submit Order"
        ]
        main_menu.each { |item| expect(stdout).to receive(:puts).with(item) }
        subject.print_main_menu(list)
      end
    end
  end

  describe '#print_menu' do
    context 'given a menu of dishes' do
      it 'prints the menu with a message' do
        menu = [
          dish1,
          dish2,
          dish3,
          dish4,
          dish5,
          dish6,
          dish7,
          dish8
        ]

        dish_menu.each { |message| expect(stdout).to receive(:puts).with(message) }
        printer.print_menu(menu)
      end
    end

    describe '#print_order' do
      context 'when order contains a dish' do
        it 'prints the quantity, dish and total price' do
          order = [dish1]
          total = 3
          expect(stdout).to receive(:puts).with("1  x  Copius Fried Wild Greens       💎  3")
          expect(stdout).to receive(:puts).with('Total:                               💎  3')
          expect(subject.print_order(order, total))
        end
      end
  
      context 'when order contains many dishes' do
        it 'prints the quantity of each unique dish' do
          order = [dish3, dish4, dish5, dish3, dish3, dish4]
          total = 28
          messages = [
            '3  x  Copius Mushroom Skewers        💎  5',
            '2  x  Vegetable Omlette              💎  6',
            '1  x  Fried Egg and Rice             💎  5',
            'Total:                               💎 28'
          ]
          messages.each { |message| expect(stdout).to receive(:puts).with(message) }
          subject.print_order(order, total)
        end
      end
    end
  end
end
