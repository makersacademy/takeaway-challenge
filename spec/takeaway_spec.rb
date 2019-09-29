require 'takeaway'

env_dishes = [
['Copius Fried Wild Greens', 3],
['Spicy Sauteed Peppers', 3],
['Copius Mushroom Skewers', 5],
['Vegetable Omlette', 6],
['Fried Egg and Rice', 5],
['Monster Curry', 6],
['Mushroom Risotto', 5],
['Creamy Heart Soup', 8]
]

twilio_to = ENV['TWILIO_TO']

describe Takeaway do
  let(:dish1) { double("Dish1", name: "Copius Fried Wild Greens", cost: 3) }
  let(:dish2) { double("Dish2", name: "Spicy Sauteed Peppers", cost: 3) }
  let(:dish3) { double("Dish3", name: "Copius Mushroom Skewers", cost: 5) }
  let(:dish4) { double("Dish4", name: "Vegetable Omlette", cost: 6) }
  let(:dish5) { double("Dish5", name: "Fried Egg and Rice", cost: 5) }
  let(:dish6) { double("Dish6", name: "Monster Curry", cost: 6) }
  let(:dish7) { double("Dish7", name: "Mushroom Risotto", cost: 5) }
  let(:dish8) { double("Dish8", name: "Creamy Heart Soup", cost: 8) }  
  let(:dish_class) { double("DishClass") }
  
  let(:order) { double("Order", 
    add: nil, 
    print_order: nil, 
    mobile_number: twilio_to, 
    check_total: :correct
    ) 
  }
  let(:order_class) { double("OrderClass", new: order) }
  
  let(:messager) { double("Messager", send_message: nil) }
  let(:messager_class) { double("MessagerClass", new: messager) }
  
  let(:printer) { double(
    "Printer",
    print_menu: nil,
    print_welcome: nil,
    print_confirmation: nil,
    print_invalid_selection: nil,
    print_main_menu: nil,
    print_exit: nil,
    print_order_submission: nil
    ) 
  }

  let(:printer_class) { double("PrinterClass", new: printer) }
  
  subject(:takeaway) { 
    dishes = [dish1, dish2, dish3, dish4, dish5, dish6, dish7, dish8]
    Takeaway.new(
      menu: dishes,
      order_class: order_class, 
      messager_class: messager_class, 
      dish_class: dish_class, 
      printer_class: printer_class
    ) 
  }
  
  it 'accepts a list of dishes when instantiated' do
    described_class.new(
      menu: [dish1, dish2], 
      order_class: order_class, 
      messager_class: messager_class, 
      dish_class: dish_class, 
      printer_class: printer_class
    )
  end

  it 'can get a list of dishes from an environment variable' do
    env_dishes.each { |dish| expect(dish_class).to receive(:new).with(name: dish[0], cost: dish[1]) }
    described_class.new(
      order_class: order_class, 
      messager_class: messager_class, 
      dish_class: dish_class, 
      printer_class: printer_class
      )
  end
  
  it 'creates an order when instantiated' do
    expect(order_class).to receive(:new).with(twilio_to)
    Takeaway.new(
      menu: [dish1], 
      order_class: order_class, 
      messager_class: messager_class, 
      dish_class: dish_class, 
      printer_class: printer_class
      )
  end
  
  it 'creates a messager when instantiated' do
    expect(messager_class).to receive(:new)
    expect(Takeaway.new(
      menu: [dish1], 
      order_class: order_class, 
      messager_class: messager_class, 
      dish_class: dish_class, 
      printer_class: printer_class
      ))
  end

  it 'creates a printer when instantiated' do
    expect(printer_class).to receive(:new)
    expect(Takeaway.new(
      menu: [dish1], 
      order_class: order_class, 
      messager_class: messager_class, 
      dish_class: dish_class, 
      printer_class: printer_class
      ))
  end
  
  describe '#run' do
    context 'in the first menu' do
      it 'prints the welcome screen and menu' do
        dishes = [dish1, dish2, dish3, dish4, dish5, dish6, dish7, dish8]
        expect(printer).to receive(:print_welcome)
        expect(printer).to receive(:print_menu).with(dishes)
        expect(takeaway).to receive(:gets).and_return("\n")
        expect(takeaway).to receive(:gets).and_return("4")
        takeaway.run
      end
      
      it 'accepts user input' do
        expect(takeaway).to receive(:gets).and_return("\n")
        allow(takeaway).to receive(:gets).and_return("4")
        takeaway.run
      end
      
      context 'when given a valid selection' do
        it 'prints a message' do
          expect(printer).to receive(:print_confirmation)
          expect(takeaway).to receive(:gets).and_return("1")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
        
        it 'forwards selection to order to be added' do
          expect(takeaway).to receive(:gets).and_return("1")
          allow(takeaway).to receive(:gets).and_return("\n")
          expect(order).to receive(:add).with(dish1)
          takeaway.run
        end
      end
      
      context 'when given an invalid selection' do
        it 'displays a warning' do
          expect(printer).to receive(:print_invalid_selection)
          expect(takeaway).to receive(:gets).and_return("100")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
        
        it 'displays a warning' do
          expect(printer).to receive(:print_invalid_selection)
          expect(takeaway).to receive(:gets).and_return("0")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
        
        it 'displays a warning' do
          expect(printer).to receive(:print_invalid_selection)
          expect(takeaway).to receive(:gets).and_return("a")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
        
        it 'asks for another input' do
          expect(takeaway).to receive(:gets).and_return("a")
          expect(takeaway).to receive(:gets).and_return("\n")
          allow(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
      end

      context 'when given a blank return' do
        it 'ends the adding process and displays the second menu' do
          list = [
            "Review Order",
            "Add Items to Order",
            "Check Total",
            "Submit Order"
          ]
          expect(printer).to receive(:print_main_menu).with(list)
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("\n")
          takeaway.run
        end
      end
    end
    context 'in the second menu' do
      it 'accepts a user input' do
        expect(takeaway).to receive(:gets).and_return("\n")
        expect(takeaway).to receive(:gets).and_return("\n")
        takeaway.run
      end
      it 'quits on blank return' do
        expect(printer).to receive(:print_exit)
        expect(takeaway).to receive(:gets).and_return("\n")
        expect(takeaway).to receive(:gets).and_return("\n")
        takeaway.run
      end

      context 'given option 1' do
        it 'prints order' do
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("1")
          allow(takeaway).to receive(:gets).and_return("\n")
          expect(order).to receive(:order).and_return([])
          expect(order).to receive(:total).and_return(0)
          expect(printer).to receive(:print_order).with([], 0)
          takeaway.run
        end
      end

      context 'given option 2' do
        it 'returns to first menu' do
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("2")
          allow(takeaway).to receive(:gets).and_return("\n")
          3.times { expect(printer).to receive(:print_menu) }
          takeaway.run
        end
      end
      
      context 'given option 3' do
        it 'forwards the total check to Order' do
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("3")
          allow(takeaway).to receive(:gets).and_return("\n")
          expect(order).to receive(:check_total)
          expect(printer).to receive(:print_checked_total)
          takeaway.run
        end
        it 'prints the return value' do
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("3")
          allow(takeaway).to receive(:gets).and_return("\n")
          expect(printer).to receive(:print_checked_total).with(:correct)
          takeaway.run
        end
      end
      
      context 'given option 4' do
        it 'sends a message request to the messager' do
          time = Time.now + (60 * 60)
          expected_time = time.to_s.split(" ")[1][0..4]
          body = "Thanks! Link should be able to glide your order over before " + expected_time
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("4")
          allow(takeaway).to receive(:gets).and_return("\n")
          expect(messager).to receive(:send_message).with(twilio_to, body)
          takeaway.run
        end

        it 'prints a confirmation message' do
          expect(takeaway).to receive(:gets).and_return("\n")
          expect(takeaway).to receive(:gets).and_return("4")
          allow(takeaway).to receive(:gets).and_return("\n")
          expect(printer).to receive(:print_order_submission)
          takeaway.run
        end
      end
    end
  end
end
