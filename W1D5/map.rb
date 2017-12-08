class Map
  attr_accessor :map
  require 'byebug'

  def initialize
    @map = []
  end

  def assign(key, value)
    map.each_index do |idx|
      map.delete(map[idx]) if map[idx][0] == key
    end

    map << [key, value]
  end

  def lookup(key)
    map.select { |item| item[0] == key }
  end

  def remove(key)
    kv_pair = nil
    map.each_index do |idx|
      if map[idx][0] == key
        kv_pair = map[idx]
      end
    end
    map.delete(kv_pair)
  end

  def show
    map
  end

end
