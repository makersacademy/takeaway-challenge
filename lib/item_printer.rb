module ItemPrinter

  def self.print(item)
       "#{item.keys[0].name} £#{item.keys[0].price} x #{item.values[0]}"
  end
end