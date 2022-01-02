class ConfirmOrder
  attr_reader :contact_number, :ordered_time, :ordered_list, :total

  def initialize(ordered_time, ordered_list, total)
    @ordered_time = ordered_time
    @ordered_list = ordered_list
    @total = total
  end
  
  def send_confirmation
    puts @ordered_time
    puts @ordered_list
    puts @total
    
  end

end