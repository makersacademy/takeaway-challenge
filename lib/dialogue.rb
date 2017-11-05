#!/usr/bin/env ruby

class Dialogue

  def confirmed(time)
    confirmed_msg % time.strftime('%H:%M:%S')
  end

  def malformed(errors)
    malformed_msg % errors
  end

  def duplicated(items)
    duplicated_msg % items.join(', ')
  end

  def unknown(items)
    unknown_msg % items.join(', ')
  end

  def confirm?(order)
    confirm_msg % [order.format, order.total]
  end

  def confirmed_msg
    "Your order has been placed! It will arrive before %s."
  end 

  def malformed_msg
    "We weren\'t able to read your order. It looks like the following " \
      "bits may have caused some problems: %s."
  end

  def duplicated_msg
    "You've ordered some items twice. To be sure that this isn't a " \
      "mistake, please take another look. Duplicates are: %s."
  end

  def unknown_msg
    "You've ordered some items that don\'t seem to exist. Please try " \
      "again. We didn\'t recognise: %s"
  end

  def confirm_msg
    "You've ordered:\n%s\nYour order totals to %s. Please text us back to " \
      "confirm (send us Y or N)."
  end
end
