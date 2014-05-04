#encoding: utf-8

require 'mr_roboto/instruction'

module MrRoboto
  class InstructionSetBuilder

    def self.build_from_file(filename)
      File.new(filename).map do |line|
        Instruction.build_from_string(line.chomp)
      end
    end
  end
end
