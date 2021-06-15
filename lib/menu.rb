class Menu
  attr_reader :list
  def initialize()
    @list = []
  end

  def add(name,price)
    @list << {:name => name,:price => price.to_f, :available => "true"}
  end

  def unavailable(number)
    @list[number -1][:available] = "false"
    @list = @list.sort_by { |hsh| hsh[:available] }.reverse
  end

  def display
    puts "Menu:"
    @list.each {|i| 
    if i[:available] == "true"
     puts "#{@list.index(i)+1}) #{i[:name]}: £#{'%.2f' % i[:price]}" 
    else
      nil
    end}
  end
end