
class Order

  def initialize
    @total = ''
  end

  def sum_items(array)
    @selected_items = array
    values = array.map{ |string| string.scan(/£(.+)$/) }
    @total = '%.2f' % values.flatten.map(&:to_f).reduce(0, :+)
  end

  def receipt
    puts formatted_receipt
    @receipt
  end

  private

  def formatted_receipt
    @receipt = <<-EOM

    The Fat Duck Restaurant
    #{@selected_items.to_yaml}
    Total: #{('£'+@total).to_yaml}

    Thank you! Your order was placed and
    will be delivered before #{(Time.now+(60*60)).strftime('%r')}

    SERVICE NOT INCLUDED
    #{Time.now.strftime("%A %B %d %r")}

    EOM
  end
end



