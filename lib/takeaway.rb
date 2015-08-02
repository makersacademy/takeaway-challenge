class Takeaway
  MENU = {
    "Breaded Koala" => 28.90,
    "Robust cherry pie" => 4.20,
    "Beetle soup" => 4.20,
    "Antelope thigh" => 30.10,
    "Panda cub surpise" => 2100.00,
    "Grilled banana" => 3.20
  }

  attr_reader :menu

  def initialize sms_sender
    @menu = MENU
    @sms_sender = sms_sender
  end

  def place_order order, total, phonenumber
    verify_order(order, total)
    confirm_order(phonenumber)
  end

  private

    def verify_order order, total
      verify_items(order)
      verify_total(order, total)
    end

    def verify_total order, total
      raise "Expected total incorrect." unless calculate_total(order) == total
    end

    def verify_items order
      order.keys.each do |item|
        raise "#{item} not on menu." unless @menu.keys.include? item
      end
    end

    def calculate_total order
      total = 0
      order.each { |item, quantity| total += @menu[item] * quantity }
      total
    end

    def confirm_order phonenumber
      @sms_sender.send_confirmation_sms(phonenumber)
    end

end