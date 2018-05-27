require_relative "menu"
require_relative "sms_confirmation_client"
require "twilio-ruby"
require "time"

class OrderingInterface
  include Menu

  def initialize(sms_util: SmsConfirmationClient)
    @sms_util = sms_util
    @login_status = false
  end

  def order(hash_args)
    check_if_total_is_given(hash_args)
    check_whether_claimed_total_is_correct(hash_args)
    check_that_each_menu_item_really_exists(hash_args)
    return confirmation_message unless logged_in?
    @sms_client.send_sms(confirmation_message)
  end

  def menu
    HORRID_DISHES.each { |dish, price|
      puts "#{dish}: £#{price}"
    }
  end

  def customer_login(account_sid:, auth_token:, sender_num:, recipient_num:)
    @sms_client = @sms_util.new(
      account_sid: account_sid,
      auth_token: auth_token,
      sender_num: sender_num,
      recipient_num: recipient_num
    )
    @login_status = true
  end

  private

  def logged_in?
    @login_status
  end

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
    "and will be delivered before " +
    "#{Time.now.strftime('%H:%M')}."
  end
end
