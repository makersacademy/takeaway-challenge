require_relative 'confirmation'

class Order

  def initialize(list_of_choices)
    @list_of_choices = list_of_choices
    @total = 0.0
  end

  def show_bill
    @list_of_choices.map { |item| "#{item[:portions]} x #{item[:choice]}: £#{item[:sub_total]}0" }.push(total)
  end

  def pay(amount)
    raise 'Please calculate the bill first' if @total == 0
    raise 'That was not enough, please try to pay again' if @total > amount
    Confirmation.new.text
    'Thank you, your confirmation text is on the way'
  end


  private

  def total
    @list_of_choices.each { |item| @total += item[:sub_total] }
    "Total: £#{@total}0"
  end
end
