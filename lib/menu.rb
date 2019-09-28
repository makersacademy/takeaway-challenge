class Menu

  def see
    list = {:Chicken=>5, :Fish=>7, :Lamb=>6, :Vegan=>5}

    list.each do |dish, price|
      puts "#{dish}: #{price}"
    end
  end
  #
  # def choose(*dish)
  #
  # end

end
