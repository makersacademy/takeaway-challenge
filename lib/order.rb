require 'dotenv'
Dotenv.load('./twilio_credentials.env')

require_relative 'list_of_dishes'
require_relative 'text_handler'

class Order
  attr_reader :summary

  def initialize(list_of_dishes, selections, total, phone_number = ENV['ORDER_PHONE_NUMBER'])
    raise ArgumentError, 'order must not be empty' if selections.empty?

    @phone_number = phone_number
    populate_summary(list_of_dishes, selections)
    verify_total(total)
  end

  def send_text(text_handler = TextHandler.new)
    text_handler.send_confirmation_text(@phone_number)
  end

  private

  def populate_summary(list_of_dishes, selections)
    @summary = {}

    selections.each do |dish, quantity|
      raise 'ordered dish not on menu' if list_of_dishes.get_dish(dish).nil?
      raise 'dish quantity must be > 0' if quantity <= 0

      full_dish = list_of_dishes.get_dish(dish)
      @summary[dish] = { quantity: quantity, price: full_dish.price }
    end
  end

  def verify_total(total)
    total_from_summary = 0
    @summary.each do |_, quantity_and_price|
      total_from_summary += quantity_and_price[:quantity] * quantity_and_price[:price]
    end
    total_from_summary = total_from_summary.round(2)

    raise_total_verification_error(total, total_from_summary) if total != total_from_summary
  end

  def raise_total_verification_error(total, total_from_summary)
    error_message = "incorrect order total. Total given = #{total}. Actual = #{total_from_summary}"
    raise ArgumentError, error_message
  end
end
