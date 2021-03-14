require 'order'
require 'twilio-ruby'
require 'message_sender'

describe Order do
  alias_method :order, :subject
  # it shows the order with the total
  describe '#view_order' do
    it 'responds to view_order' do
      expect(order).to respond_to(:view_order)
    end
    it 'it raises an error if there is no order and somebody tries to view the order' do
      expect { order.view_order }.to raise_error "No items in order"
    end
  end

  # it displays the menu
  describe '#view_menu' do
    it 'if displays the menu' do
      expect(order.view_menu).to eq "    1. Moluccan Margherita £6.00\n    2. Conure Caramelised Onion and Goats Cheese £8.00\n    3. Macaw Mushroom £7.00\n    4. Fischer's Four Cheese £8.00\n    5. Blue Fronted Cheese and Roasted Potato £8.00\n    6. Chattering Cheesy Dough Balls £3.00\n    7. Ducorps Dough Balls £2.50"
    end
    it 'responds to view_menu' do
      expect(order).to respond_to(:view_menu)
    end
  end

  # user selects dishes
  describe '#add_item' do
    it 'responds to add_item' do
      expect(order).to respond_to(:add_item)
    end
    it 'user can add items from the menu to their order' do
      order.add_item(2)
      expect(order.view_order).to eq "Item No.2: 1x Conure Caramelised Onion and Goats Cheese £8.00\nTotal: £8.00"
    end
    it 'raises an error if the user attempts to add an item that doesn\'t exist' do
      expect { order.add_item(10) }.to raise_error "This item doesn't exist! Why don't you try a Conure Caramelised Onion Pizza - add_item(2)? It's delicious!"
    end
  end
  # user deletes dishes

  describe '#delete_item' do
    it 'responds to delete_item' do
      expect(order).to respond_to(:delete_item)
    end
    it 'when user inputs delete_item(1), it deletes item number 1 from the order' do
      order.instance_variable_set(:@order,
        [{ :name => "Moluccan Margherita", :price => 6, :quantity => 1 },
        { :name => "Conure Caramelised Onion and Goats Cheese", :price => 8, :quantity => 0 },
        { :name => "Macaw Mushroom", :price => 7, :quantity => 3 },
        { :name => "Fischer's Four Cheese", :price => 8, :quantity => 0 },
        { :name => "Blue Fronted Cheese and Roasted Potato", :price => 8, :quantity => 2 },
        { :name => "Chattering Cheesy Dough Balls", :price => 3, :quantity => 2 },
        { :name => "Ducorps Dough Balls", :price => 2.5, :quantity => 1 }]
        )
      order.instance_variable_set(:@total, 54)
      expect { order.delete_item(1) }.to change { order.order }.from(
        [{ :name => "Moluccan Margherita", :price => 6, :quantity => 1 },
        { :name => "Conure Caramelised Onion and Goats Cheese", :price => 8, :quantity => 0 },
        { :name => "Macaw Mushroom", :price => 7, :quantity => 3 },
        { :name => "Fischer's Four Cheese", :price => 8, :quantity => 0 },
        { :name => "Blue Fronted Cheese and Roasted Potato", :price => 8, :quantity => 2 },
        { :name => "Chattering Cheesy Dough Balls", :price => 3, :quantity => 2 },
        { :name => "Ducorps Dough Balls", :price => 2.5, :quantity => 1 }]
      ).to(
        [{ :name => "Moluccan Margherita", :price => 6, :quantity => 0 },
        { :name => "Conure Caramelised Onion and Goats Cheese", :price => 8, :quantity => 0 },
        { :name => "Macaw Mushroom", :price => 7, :quantity => 3 },
        { :name => "Fischer's Four Cheese", :price => 8, :quantity => 0 },
        { :name => "Blue Fronted Cheese and Roasted Potato", :price => 8, :quantity => 2 },
        { :name => "Chattering Cheesy Dough Balls", :price => 3, :quantity => 2 },
        { :name => "Ducorps Dough Balls", :price => 2.5, :quantity => 1 }]
      )
    end
    it 'raises an error if the item they\'re trying to delete doesn\'t exist in their order' do
      order.add_item(1)
      expect { order.delete_item(3) }.to raise_error "This item isn't in your order! Did you mean to add it?"
    end
    it "raises an error if there are no items in their order" do
      expect { order.delete_item(3) }.to raise_error "No items in order"
    end
  end
  # it returns the total of the order
  describe '#view_total' do
    it 'responds to view_total' do
      expect(order).to respond_to(:view_total)
    end
    it 'the total of a Moluccan Margherita and a Conure Caramelised Onion and Goats Cheese is £14' do
      order.add_item(1)
      order.add_item(2)
      expect(order.view_total).to eq "£14.00"
    end
    it 'the total of 2 lots of Chattering Cheesy Dough Balls and a Blue Fronted Cheese and Roasted Potato is £14' do
      order.add_item(6)
      order.add_item(6)
      order.add_item(5)
      expect(order.view_total).to eq "£14.00"
    end
    it 'raises an error if the user attempts to view the total for an empty order' do
      expect { order.view_total }.to raise_error "No items in order"
    end
  end
  # it knows the time
  describe '#time' do
    it 'returns the correct time' do
      t = (Time.now + 1 * 60 * 60).strftime("%I:%M %p")
      expect(order.delivery_time).to eq t
    end
  end
  # it responds to place order
  describe '#place_order' do
    it 'responds to place_order' do
      expect(order).to respond_to(:place_order)
    end
    it 'calls send_text when the order is placed' do
      message_sender = double("message_sender")
      order = Order.new(message_sender, Menu.new)
      expect(message_sender).to receive(:send_message)
      order.add_item(1)
      order.place_order(123)
    end
    it 'won\'t place an empty order' do
      message_sender = double("message_sender")
      order = Order.new(message_sender, Menu.new)
      expect { order.place_order(123) }.to raise_error "No items in order"
    end
  end
  # it sends a text
  describe '#send_text' do
    it 'responds to send_text' do
      message_sender = double("message_sender")
      order = Order.new(message_sender, Menu.new)
      allow(message_sender).to receive(:send_message)
      order.add_item(1)
      expect(order).to respond_to(:send_text).with(1).argument
      order.send_text(1)
    end
    it 'when the user places the order at 14.53, it texts them to say that the order will be ready at 15.53' do
      message_sender = double("message_sender")
      order = Order.new(message_sender, Menu.new)
      order.instance_variable_set(:@delivery_time, '03:53 PM')
      allow(message_sender).to receive(:send_message)
      order.add_item(1)
      expect(message_sender).to receive(:send_message).with(1, "Thank you for placing your order with Parrot Pizza Parlour. Order number: 2346 containing: 1x Moluccan Margherita £6.00\n.Total: £6.00. Your order will be delivered within one hour, by 03:53 PM")
      order.place_order(1)
    end
  end
  describe '#help' do
    it 'displays a list of commands' do
      expect(order.help).to eq "HELP\nview_menu - Display the menu\nadd_item_(Item No.) - Add an item to your order.\nview_order - View your order\ndelete_item_(Item No.) - Delete an item from your order.\nview_total - View the total cost of your order\nplace_order(phone_no.) - Place your order."
    end
  end
end
