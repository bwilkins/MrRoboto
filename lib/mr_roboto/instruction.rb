#encoding: utf-8

module MrRoboto
  class Instruction

    attr_reader :command, :parameters

    def initialize(command, parameters = [])
      @command = command
      @parameters = parameters
    end

    def self.build_from_string(input)
      parameters = input.split(/\W/)
      parameters = ParameterCleaner.clean_parameters(parameters)
      command = parameters.shift

      new(command, parameters)
    end
  end
end
