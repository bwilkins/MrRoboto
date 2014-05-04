#encoding: utf-8

module MrRoboto
  class Instruction

    attr_reader :command, :parameters

    def initialize(command, parameters = [])
      @command = command
      @parameters = parameters
    end
  end
end
