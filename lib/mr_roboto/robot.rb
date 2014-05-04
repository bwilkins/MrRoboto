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
      @table.place(self, x, y)
      @heading = heading
      nil
    end

    def move
      @table.move(self, @heading)
      nil
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
      nil
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
      nil
    end

    def perform_instruction(instruction)
      self.public_send(instruction.command, *instruction.parameters)
    end

    private
  
    def position
      @table.position_of(self)
    end
  end
end
