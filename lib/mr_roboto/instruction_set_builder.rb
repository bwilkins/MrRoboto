#encoding: utf-8

require 'mr_roboto/instruction_set'
require 'mr_roboto/instruction'

module MrRoboto
  class InstructionSetBuilder

    def self.build_from_file(filename)
      instruction_set = InstructionSet.new
      File.new(filename).each do |line|
        instruction_set << Instruction.build_from_string(line.chomp)
      end
      instruction_set
    end
  end
end
