class Output_Menu

  def display(menu)
    output = "Adi's Takeaway Menu\n-------------------\n"
    menu.each {|item| output += "Item: #{item[:item]} - #{item[:price]}\n"}
  end

end
