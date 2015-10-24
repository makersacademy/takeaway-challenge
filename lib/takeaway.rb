class Takeaway
attr_reader :ordered_dishes

  def initialize
    @menu_file = 'menu-file.txt'
    @ordered_dishes = []
  end

  def menu
    File.read(menu_file).each_line do |line|
      puts line
    end
  end

  def klass_iterator (array)
    array.each do |k|
      @ordered_dishes << k.new
    end
  end

  def order(total,*dish_klasses)
    if dish_klasses.inject{|sum, k| sum + k.price} != total
      raise 'the total provided does not match the sum of the prices of the dishes selected'
    end
    @total
  end

private
attr_reader :menu_file
end
