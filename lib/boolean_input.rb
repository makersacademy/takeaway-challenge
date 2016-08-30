# Standard module for getting yes or no answers :)
module Boolean_input
	def yn initial_message, fail_message=nil
		puts initial_message + " (Y/N)"
		choice = gets.chomp
		case choice.upcase
		when "Y"
			return true
		when "N"
			return false
		else
			puts "Wrong input! Only Y or N please"
			yn(initial_message, fail_message)
		end
	end
end

