# Allows the user to confirm their selections before sending it.

class Order

  def initialize
    @summary = []
    @total_price = 0
    @confirmed = false
  end

  attr_reader :summary, :total_price, :confirmed



  def confirm
    print_order
    puts "Confirm order? (Y/N)"
    gets_confirmation
    raise "Cannot confirm order: user confirmation required." unless confirmed?
    puts "Thank you for confirming your order. You can now send it."
   end

   def total
     calculate_total if price_is_zero?
   end

    def print_order
      total
      puts "You have ordered:"
      summary.each do |dish|
        puts "#{dish[:name]} x#{dish[:quantity]}"
      end
      puts "The total is £#{total_price}"
    end

  private

  def gets_confirmation
    confirmation = gets.chomp
      self.confirmed = true if confirmation.upcase! == "Y"
   end

   def confirmed?
     confirmed
   end

   def price_is_zero?
     total_price == 0
   end

   def calculate_total
     summary.each do |dish|
       self.total_price += (dish[:price] * dish[:quantity])
     end
     total_price
   end


  attr_writer :total_price, :confirmed
end
