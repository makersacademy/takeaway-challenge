require_relative '../lib/object_printer'

module ObjectListPrinter
  def self.to_string(objects, object_printer = ObjectPrinter)
    objects.each_with_index.map { |object, index|
      object_printer.to_string(object, index + 1)
    }.join("\n")
  end
end
