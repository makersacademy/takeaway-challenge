module ItemPrinter
  def self.to_string(item)
    "#{item.name} - £#{item.price.to_s}"
  end
end
