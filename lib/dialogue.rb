# Dialogue provides formatted messages for responses to clients.
class Dialogue
  def confirmed(time)
    "Your order has been placed! It will arrive before %s." % time
  end

  def malformed(errors)
    "We weren\"t able to read your order. It looks like the following " \
      "bits may have caused some problems: %s." % errors
  end

  def duplicated(errors)
    "You\"ve ordered some items twice. To be sure that this isn\"t a " \
      "mistake, please take another look. Duplicates are: %s." % errors
  end

  def missing(items)
    "You\"ve ordered some items that don\"t seem to exist. Please try " \
      "again. We didn\"t recognise: %s" % items
  end

  def finalise(order)
    "You\"ve ordered:\n%s\nYour order totals to %s. Please text us back to " \
      "confirm (send us Y or N)." % [order.format, order.total]
  end

  def no_order
    "You have no order in progress at the moment."
  end

  def in_progress
    "An order is currently in progress. Please confirm or cancel before" \
      "ordering again."
  end

  def cancel
    "Your order has been cancelled."
  end
end
