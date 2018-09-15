class Printer

  def format(something_to_print)
    something_to_print.each{|hash|
    puts "#{hash[:key]}: #{hash[:value]}"}

  end

end

# { |hash| hash.each { |key, value|
#   puts "#{key}, #{value}"}
