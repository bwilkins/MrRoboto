#encoding: utf-8

module MrRoboto
  class Robot

    attr_reader :heading

    def initialize(table)
      @table = table
      @heading = nil
    end

    def report
      return 'No other instructions given!' unless position
      "#{position[:x]},#{position[:y]},#{@heading.upcase}"
    end

    def place(x, y, heading)
      @table.place(x, y)
      @heading = heading
    end

    def move
      @table.move(self, @heading)
    end

    def left
      @heading = case @heading
      when :north
        :west
      when :south
        :east
      when :east
        :north
      when :west
        :south
      end
    end

    def right
      @heading = case @heading
      when :north
        :east
      when :south
        :west
      when :east
        :south
      when :west
        :north
      end
    end

    private
  
    def position
      @table.position_of(self)
    end
  end
end
