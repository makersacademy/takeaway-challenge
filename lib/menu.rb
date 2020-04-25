class Menu

  attr_reader :list

  def initialize
    @list = [ {id: 01, name: "Kebap", price: 1.00},
              {id: 02, name: "Breakfast", price: 1.00},
              {id: 03, name: "Pizza", price: 1.00} ]
  end

  def generator
    for i in 0...@list.count
      p "#{@list[i][:id]}: #{@list[i][:name]} #{@list[i][:price]}£"
    end
  end


end
