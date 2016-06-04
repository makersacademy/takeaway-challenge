
class TimedReceipt
  def initialize(selected_items,total)
    @selected_items = selected_items
    @total = total
  end

  def receipt
    @receipt = <<-EOM

    The Fat Duck Restaurant
    #{receipt_items}
    Total: #{receipt_total}

    Thank you! Your order was placed and
    will be delivered before #{time_in_an_hour}

    SERVICE NOT INCLUDED
    #{time_now}

    EOM
  end

  private

  def receipt_items
    @selected_items.sort.to_yaml
  end

  def receipt_total
    ('£'+ @total).to_yaml
  end

  def time_now
    Time.now.strftime("%A %B %d %r")
  end

  def time_in_an_hour
    (Time.now+(60*60)).strftime('%r')
  end
end