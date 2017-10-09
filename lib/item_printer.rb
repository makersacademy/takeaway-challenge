module ItemPrinter
  def self.to_string(object, index)
    str = "#{index}. "
    str << object.keys.map { |key|
      "#{object[key]}          "
    }.join
  end
end
