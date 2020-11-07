class RamenBar 

  attr_reader :dishes

  def initialize
    @dishes = [
      {:name => 'tonkotsu', :price => 10}, 
      {:name => 'kakugiri', :price => 9 },
      {:name => 'shoyu',    :price => 9 },
      {:name => 'gyoza',    :price => 5 },
      {:name => 'edamame',  :price => 3 },
    ]
  end

  def menu
    @dishes.each do |dish|

      puts "#{dish[:name]} => £#{dish[:price]}"
    
    end
  end

end