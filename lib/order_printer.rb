module OrderPrinter
  
  def pretty_print options = {}
    "Order summary:\n%<items>s\nTotal: £%<total>.2f\nStatus: %<state>s" % options
  end
end
