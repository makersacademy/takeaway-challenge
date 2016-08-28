#formats the input menu into a string
module MenuParser

  def self.format_menu(menu)
    output_string = ''
    menu.each.with_index do |item, i|
      output_string << "#{i} - #{item[:description]} - £#{item[:price]}\n"
    end 
    output_string
  end 

end 
