require 'takeaway'

welcome_message = "Welcome to Link's Wild Delivery!"
first_menu = [
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

second_menu = [
  "1.  Review Order",
  "2.  Add Items to Order",
  "3.  Check Total",
  "4.  Submit Order",
  "Please make a selection:"
]

confirm_messages = [
  "Added to order.",
  "Anything else? Enter to finish adding items."
]
quit_message = "Sorry to see you go! Come back soon!"
twilio_account_sid = ENV['TWILIO_SID']
twilio_token = ENV['TWILIO_TOKEN']
twilio_to = ENV['TWILIO_TO']
twilio_from = ENV['TWILIO_FROM']

describe Takeaway do
  let(:dish1) { double("Dish1", name: "Copius Fried Wild Greens", cost: 3) }
  let(:dish2) { double("Dish2", name: "Spicy Sauteed Peppers", cost: 3) }
  let(:dish3) { double("Dish3", name: "Copius Mushroom Skewers", cost: 5) }
  let(:dish4) { double("Dish4", name: "Vegetable Omlette", cost: 6) }
  let(:dish5) { double("Dish5", name: "Fried Egg and Rice", cost: 5) }
  let(:dish6) { double("Dish6", name: "Monster Curry", cost: 6) }
  let(:dish7) { double("Dish7", name: "Mushroom Risotto", cost: 5) }
  let(:dish8) { double("Dish8", name: "Creamy Heart Soup", cost: 8) }  

  let(:order) { double("Order", add: nil, print_order: nil, mobile_number: twilio_to) }
  let(:order_class) { double("OrderClass", new: order) }

  let(:messager) { double("Messager", send_message: nil) }
  let(:messager_class) { double("MessagerClass", new: messager) }
  
  subject(:takeaway) { 
    dishes = [dish1, dish2, dish3, dish4, dish5, dish6, dish7, dish8]
    Takeaway.new(dishes, order_class, messager_class) 
  }
  
  it 'accepts a list of dishes when instantiated' do
    expect(described_class.new([dish1, dish2], order_class, messager_class))
  end
  
  it 'creates an order when instantiated' do
    expect(order_class).to receive(:new).with(twilio_to)
    expect(Takeaway.new([dish1], order_class, messager_class))
  end
  
  it 'creates a messager when instantiated' do
    expect(messager_class).to receive(:new)
    expect(Takeaway.new([dish1], order_class, messager_class))
  end
  
  describe '#run' do
    context 'in the first menu' do
      it 'prints the welcome screen and menu' do
        allow(STDOUT).to receive(:puts).with(any_args)
        first_menu.each { |message| expect(STDOUT).to receive(:puts).with(message) }
        expect(takeaway).to receive(:gets).and_return("\n")
        expect(takeaway).to receive(:gets).and_return("4")
        takeaway.run
      end
      
      it 'accepts user input' do
        allow(STDOUT).to receive(:puts).with(any_args)
        expect(takeaway).to receive(:gets).and_return("\n")
        allow(takeaway).to receive(:gets).and_return("4")
        takeaway.run
      end
      
      context 'when given a valid selection' do
        it 'prints a message' do
          allow(STDOUT).to receive(:puts).with(any_args)
          confirm_messages.each { |message| expect(STDOUT).to receive(:puts).with(message) }
          expect(takeaway).to receive(:gets).and_return("1")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
        
        it 'forwards selection to order to be added' do
          expect(takeaway).to receive(:gets).and_return("1")
          allow(takeaway).to receive(:gets).and_return("\n")
          allow(STDOUT).to receive(:puts).with(any_args)
          expect(order).to receive(:add).with(dish1)
          takeaway.run
        end
      end
      
      context 'when given an invalid selection' do
        it 'displays a warning' do
          allow(STDOUT).to receive(:puts).with(any_args)
          expect(STDOUT).to receive(:puts).with("Invalid selection, try again or Enter to finish.")
          expect(takeaway).to receive(:gets).and_return("100")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
        
        it 'displays a warning' do
          allow(STDOUT).to receive(:puts).with(any_args)
          expect(STDOUT).to receive(:puts).with("Invalid selection, try again or Enter to finish.")
          expect(takeaway).to receive(:gets).and_return("0")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
        
        it 'displays a warning' do
          allow(STDOUT).to receive(:puts).with(any_args)
          expect(takeaway).to receive(:gets).and_return("a")
          expect(STDOUT).to receive(:puts).with("Invalid selection, try again or Enter to finish.")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
        
        it 'asks for another input' do
          expect(takeaway).to receive(:gets).and_return("a")
          allow(STDOUT).to receive(:puts).with(any_args)
          expect(takeaway).to receive(:gets).and_return("\n")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
      end

      context 'when given a blank return' do
        it 'ends the adding process and displays the second menu' do
          allow(STDOUT).to receive(:puts).with(any_args)
          second_menu.each { |message| expect(STDOUT).to receive(:puts).with(message) }
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
      end
    end
    context 'in the second menu' do
      it 'accepts a user input' do
        allow(STDOUT).to receive(:puts).with(any_args)
        expect(takeaway).to receive(:gets).and_return("\n")
        expect(takeaway).to receive(:gets).and_return("\n")
        takeaway.run
      end
      it 'quits on blank return' do
        expect(STDOUT).to receive(:puts).with(welcome_message)
        expect(STDOUT).to receive(:puts).with(quit_message)
        allow(STDOUT).to receive(:puts).with(any_args)
        expect(takeaway).to receive(:gets).and_return("\n")
        expect(takeaway).to receive(:gets).and_return("\n")
        takeaway.run
      end

      context 'given option 1' do
        it 'forwards print request to order' do
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("1")
          allow(takeaway).to receive(:gets).and_return("\n")
          allow(STDOUT).to receive(:puts).with(any_args)
          expect(order).to receive(:print_order)
          takeaway.run
        end
      end

      context 'given option 2' do
        it 'returns to first menu' do
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("2")
          allow(takeaway).to receive(:gets).and_return("\n")
          allow(STDOUT).to receive(:puts).with(any_args)
          first_menu.each { |message| expect(STDOUT).to receive(:puts).with(message).twice }
          takeaway.run
        end
      end
      
      context 'given option 3' do
        it 'forwards the total check to Order' do
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("3")
          allow(takeaway).to receive(:gets).and_return("\n")
          expect(order).to receive(:check_total)
          allow(STDOUT).to receive(:puts).with(any_args)
          takeaway.run
        end
      end
      
      context 'given option 4' do
        it 'sends a message request to the messager' do
          expected_time = ((Time.now + (60 * 60)).to_s.split(" "))[1][0..4]
          body = "Thanks! Link should be able to glide your order over before " + expected_time
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("4")
          allow(takeaway).to receive(:gets).and_return("\n")
          allow(STDOUT).to receive(:puts).with(any_args)
          expect(messager).to receive(:send_message).with(twilio_to, body)
          takeaway.run
        end
      end
    end
  end
end
