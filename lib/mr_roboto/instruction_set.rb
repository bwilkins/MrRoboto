#encoding: utf-8

module MrRoboto
  class InstructionSet
    extend Forwardable
    def_delegators :@instructions, :each, :<<
    include Enumerable


    def self.build_from_file(filename)
      instruction_set = InstructionSet.new
      File.new(filename).each do |line|
        instruction_set << line
      end
      instruction_set
    end

    def initialize(instructions = [])
      @instructions = instructions
    end
  end
end
