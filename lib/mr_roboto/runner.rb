#encoding: utf-8

require 'mr_roboto'
require 'mr_roboto/instruction_set_builder'
require 'mr_roboto/table'
require 'mr_roboto/robot'

module MrRoboto

  class Runner

    def run(args)
      filename = args.first
      return "No such file or directory #{filename}" unless File.exists?(filename)
      instructions = InstructionSetBuilder.build_from_file(filename)
      
      table = Table.new(5, 5)
      robot = Robot.new(table)

      ret = []
      
      instructions.each do |instruction|
        puts "#{instruction.parameters}"
        ret << robot.perform_instruction(instruction)
      end

      return ret.compact.join("\n")

    end

  end

end
