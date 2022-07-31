class Menu 
# open and closed principle - classes should be open for extention but closed for modificaiton 

attr_reader :dishes 

 def initialize(dishes)
    @dishes = dishes 
 end 

 def print_menu  #interate through the hash and change it into a string
    dishes.map do |dish, price|
        "#{dish} = #{price}"
    end.join(", ")


 end 

end 