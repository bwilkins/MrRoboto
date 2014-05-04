#encoding: utf-8

module MrRoboto
  class InstructionSet
    extend Forwardable
    def_delegators :@instructions, :each, :<<
    include Enumerable

    def initialize(instructions = [])
      @instructions = instructions
    end
  end
end
