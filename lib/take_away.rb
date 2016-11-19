class TakeAway

  def menu
    dishes = [{chicken: 5}, {beef: 6}, {pork: 7}]
  end

  def order(*args)
    string = ""
    args.each_slice(2) do |name,number|
      menu.each do |dish|
        string << "#{number} dish(es) of #{name} " if dish.include?(name.to_sym)
      end
    end
    "You ordered " + string 
  end

end
