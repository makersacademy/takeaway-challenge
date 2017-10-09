module ItemPrinter
  def self.to_string(object, index)
    str = "#{index}. "
    str << object.keys.map { |key|
      value = eval("object.#{key}")
      "#{value}          "
    }.join
  end
end
