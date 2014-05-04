#encoding: utf-8

module MrRoboto
  class OutOfBoundsError < StandardError; end;
  class Table
    attr_reader :max_x, :max_y, :items

    def initialize(max_x, max_y)
      @max_x, @max_y = max_x, max_y
      @items = Hash.new
    end

    def place(item, x, y)
      @items[item] = {x: x, y: y} if valid_position?(x, y)
    end

    def move(item, heading)
      position = @items[item].dup

      case heading
      when :north
        position[:y] += 1
      when :south
        position[:y] -= 1
      when :east
        position[:x] += 1
      when :west
        position[:x] -= 1
      end

      items[item] = position if valid_position?(position[:x], position[:y])
    end

    def position_of(item)
      items[item]
    end

    def valid_position?(x, y)
      (0...max_x).cover?(x) && (0...max_y).cover?(y)
    end

    def [](x,y)
      raise OutOfBoundsError unless valid_position?(x, y)
      items.each_pair do |item, position|
        return item if position[:x] == x && position[:y] == y
      end

      nil
    end

  end
end
