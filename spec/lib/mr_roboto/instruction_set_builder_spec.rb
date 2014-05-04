#encoding: utf-8

require_relative '../../spec_helper'
require 'tempfile'

require 'mr_roboto/instruction_set_builder'

module MrRoboto
  describe InstructionSetBuilder do

    describe '.build_from_file' do
      let(:file) do
        f = Tempfile.new('instructions')
        f.write("PLACE 0, 0, NORTH\n")
        f.write("MOVE\n")
        f.write("REPORT\n")
        f.rewind
        f
      end

      let(:filename) { file.path }

      after :each do
        file.close
        file.unlink
      end

      let(:instruction_set) { InstructionSetBuilder.build_from_file(filename) }

      it 'returns an Array' do
        expect(instruction_set).to be_a Array
      end

      it 'has 3 members' do
        expect(instruction_set).to have(3).instructions
        instruction_set.each do |instruction|
          expect(instruction).to be_a Instruction
        end
      end


    end
  end
end
