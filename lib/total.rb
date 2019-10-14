class Total

  def initialize(items, dishes)
    @arr_items, @dishes, @total, @check = items.split(', '), dishes, 0, ''
  end

  def calculate
    @arr_items.each{ |item| @total += @dishes[item]
      @check << item.to_s + ' = ' + @dishes[item].to_s + ' '}
    @check + 'total = ' + '£' +@total.to_s
  end

end
