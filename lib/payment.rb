# Verifies total bill is correct
class Payment
attr_accessor :received_total

  def receive_payment
    puts "Please provide amount to be paid"
    @received_total = $stdin.gets.chomp.to_i
    raise "Selection cancelled" if @received_total.zero?
  end

  def check_bill(received_total = @received_total, expected_total)
    raise "Incorrect amount entered: Please try again" if received_total != expected_total
  end

end
