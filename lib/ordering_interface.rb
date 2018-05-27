require "menu"
require "twilio-ruby"
require "time"

class OrderingInterface
  include Menu

  def initialize(
      account_sid: nil,
      auth_token: nil,
      sender_number: nil,
      recipient_number: nil
    )
    @account_sid = account_sid
    @auth_token = auth_token
    @sender_number = sender_number
    @recipient_number = recipient_number
  end

  def order(hash_args)
    check_if_total_is_given(hash_args)
    check_whether_claimed_total_is_correct(hash_args)
    check_that_each_menu_item_really_exists(hash_args)
    return confirmation_message if api_info_incomplete?
    send_sms(confirmation)
  end  

  def menu
    HORRID_DISHES
  end

  private

  def check_if_total_is_given(hash_args)
    raise "No total given!" if hash_args[:total].nil?
  end

  def check_that_each_menu_item_really_exists(hash_args)
    hash_args.delete(:total)
    hash_args.keys.each { |dish|
      raise "Unknown dish!" unless HORRID_DISHES.key? dish
    }
  end

  def check_whether_claimed_total_is_correct(hash_args)
    claimed_total = hash_args[:total]
    hash_args.delete(:total)
    calc_total = hash_args.values.reduce { |accumulator, quantity|
      accumulator + quantity
    }
    raise "Total doesn't match!" unless calc_total == claimed_total
  end

  def confirmation_message
    "Thank you! Your order was placed " +
    "and will be delievered before " +
    "#{Time.now.strftime('%H:%M')}."
  end

  def api_info_incomplete?
    @account_sid.nil? ||
      @auth_token.nil? ||
      @sender_number.nil? ||
      @recipient_number.nil?
  end

  def send_sms(string)
    client = Twilio::REST::Client.new @account_sid, @auth_token
    client.api.account.messages.create(
      from: @sender_number,
      to: @recipient_number,
      body: string
    )
  end

end
