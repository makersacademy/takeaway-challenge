require "twilio-ruby"
require "time"

class OrderingInterface

  HORRID_DISHES = {
    gelatinous_grime_goulash: 7,
    crispy_cockroach_croquettes: 8,
    reeking_rat_ravioli: 11,
    slug_slime_secretion_soup: 9,
  }

  def initialize(
      account_sid = nil,
      auth_token = nil
    )
    @account_sid = account_sid
    @auth_token = auth_token
    @sender_number = "+447480539252"
    @recipient_number = "+447506661424"
  end

  def order(args_as_hash)
    raise "No total given!" unless !!args_as_hash[:total]
    given_total = args_as_hash[:total]
    args_as_hash.delete(:total)
    args_as_hash.keys.each { |dish|
      raise "Unknown dish!" unless HORRID_DISHES.keys.include? dish
    }
    calculated_total = args_as_hash.values.reduce { |acc, quant|
      acc + quant
    }
    raise "Total doesn't match!" unless calculated_total == given_total
    confirmation = "Thank you! Your order was placed and will be delievered before #{Time.now.strftime('%H:%M')}."
    return confirmation if api_info_incomplete?
    send_sms(confirmation)
  end  

  def menu
    HORRID_DISHES
  end

  private

  def api_info_incomplete?
    @account_sid.nil? || @auth_token.nil? || @sender_number.nil? || @recipient_number.nil?
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