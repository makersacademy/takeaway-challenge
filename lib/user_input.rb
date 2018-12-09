class UserInput

  def ask(item)
    puts "Would you like to have #{item}?"
    gets.chomp == 'Yes'
  end

  def quantity
    puts "How many?"
    gets.to_i || 0
  end

end
