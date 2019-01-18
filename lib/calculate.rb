module Calculate
  def self.add(array)
    arr = []
    array.each { |element|
      element.each { |key, val|
        arr << val.to_i
      }
    }
    arr.reduce(:+)
  end
end