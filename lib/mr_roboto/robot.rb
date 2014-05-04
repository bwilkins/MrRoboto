#encoding: utf-8

module MrRoboto
  class Robot

    def initialize(table)
      @table = table
      @heading = nil
    end

    def report
      position = @table.position_of(self)
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

  end
end
