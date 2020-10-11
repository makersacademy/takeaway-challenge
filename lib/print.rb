class Print

  def print(menu)

    menu.each do |key, value|
     puts key + ": " + "$#{value}"
    end

  end

end