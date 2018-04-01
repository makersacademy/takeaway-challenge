module OrderPrinter
  
  def pretty_print options = {}
    "Order summary\n%<items>s\nTotal: %<total>.2f\nStatus: %<status>s" % options
  end
end
