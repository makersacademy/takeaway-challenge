require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu_string) { "Margherita, price = £4\nPepperoni, price = £5\nRomana, price = £6\nDouble cheese, price = £5\nVegetarian, price = £5"
  }
  let(:order_string) { "Margherita x3 = £12\nPepperoni x2 = £10\nTotal = £22" }
  let(:confirmation) { "Thank you for your order, confirmation has been sent via text message\n" }
  let(:delivery_string) { "Thank you! Your order was placed and will be delivered soon." }

  it '#view_menu should print the menu' do
    expect { takeaway.view_menu }.to output(menu_string).to_stdout
  end

  context '#add dishes to order' do
    before do
      takeaway.add("Margherita", 3)
      takeaway.add("Pepperoni", 2)
    end

    it 'should display dishes added, their quantities, and order total' do
      expect { takeaway.view_order }.to output(order_string).to_stdout
    end

    it 'should return current total' do
      expect { takeaway.total }.to output("22\n").to_stdout
    end

    it 'should confirm payment is correct and order placed' do
      expect { takeaway.complete_order(22) }.to output(confirmation).to_stdout
    end

    it 'sends a payment confirmation text message' do
      expect(takeaway).to receive(:send_text).with(delivery_string)
      takeaway.complete_order(22)
    end

    it 'should have a message object that sends texts' do
      expect(takeaway).to respond_to(:messager)
    end

    it 'should have a add method' do
      expect(takeaway).to respond_to(:add)
    end

  end
end
