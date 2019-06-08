module ItemPrinter
  def self.to_string(item)
    "#{item.name} - £#{item.price.to_s}0"
  end
end
