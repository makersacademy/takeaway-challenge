require 'object_list_printer'

class ObjectList
  attr_reader :objects
  def initialize(objects = [])
    @objects = objects
  end

  def add(objects)
    objects.each { |object| @objects << object }
  end

  def to_string(object_list_printer = ObjectListPrinter)
    object_list_printer.to_string(all)
  end

  def get(index)
    all[index]
  end

  private

  def all
    @objects
  end
end
