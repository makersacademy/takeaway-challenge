module OrderItemPrinter

  def pretty_print(options = {})
    options[:dish].gsub!(/^.+?:/, '')
    "Order item %<id>s: %<dish>s x %<quantity>i : £%<price>.2f" % options 
  end
end
