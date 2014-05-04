#encoding: utf-8

module MrRoboto
  class OutOfBoundsError < StandardError; end;
  class Table
    attr_reader :max_x, :max_y, :items

    def initialize(max_x, max_y)
      @max_x, @max_y = max_x, max_y
      @items = Hash.new
    end

    def place(robot, x, y)
      @items[robot] = [x, y] if valid_position?(x, y)
    end

    def valid_position?(x, y)
      (0..max_x).cover?(x) && (0..max_y).cover?(y)
    end

    def [](x,y)
      raise OutOfBoundsError unless valid_position?(x, y)
      @items.each do |item, position|
        return item if position == [x, y]
      end

      nil
    end

  end
end
