require './lib/text_sender.rb'

class Menu

  attr_accessor :selected_items
  attr_reader :text_sender


  def initialize text_sender

    @menu_items = {pizza: 9.99,
                  fried_chicken: 4.99,
                  coke: 0.99,
                  beer: 2.89,
                  wine: 6.99
                  }
    @selected_items = {}
    @text_sender = text_sender

  end

  def show
    menu_items.each do |menu_item,price|
      "#{menu_item.to_s.capitalize} ---- £#{price}"
    end
  end

  def choose quantity, menu_selection
    if selection_has_already_been_chosen? menu_selection
      update_existing_items quantity, menu_selection
    else
      add_new_item quantity, menu_selection
    end
  end

  def selections
    selected_items.each do |menu_item, quantity|
      "#{quantity} x #{menu_item.to_s.capitalize}"
    end
  end

  def total
    total_price = 0.0
    selected_items.each do |selected_item, quantity|
      find_price selected_item
      total_price += (@price * quantity)
    end
    price = sprintf "%.2f", total_price
    "£#{price}"
  end

  def order phone_number
    self.text_sender.send_text(phone_number, order_message)
  end

  private

  attr_reader :menu_items

  def selection_has_already_been_chosen? menu_selection
    selected_items.has_key? menu_selection
  end

  def add_new_item quantity, menu_selection
    menu_items.select do |menu_item,v|
      if menu_item == menu_selection.to_sym
        self.selected_items[menu_item] = quantity
      end
    end
  end

  def update_existing_items quantity, menu_selection
    current_quantity = selected_items[menu_selection.to_sym]
    selected_items[menu_selection.to_sym] = current_quantity + quantity
  end

  def find_price selected_item
    menu_items.select do |menu_item, value|
      @price = menu_items[selected_item]
    end
  end

  def time_in_an_hour
    t = Time.new
    t += (60*60)
    t.strftime("%R")
  end

  def order_message
    "Thanks! Your order should be delivered before #{time_in_an_hour}, The total is #{total}."
  end


end