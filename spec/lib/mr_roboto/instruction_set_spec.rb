#encoding: utf-8

require_relative '../../spec_helper'
require 'tempfile'

require 'mr_roboto/instruction_set'

module MrRoboto
  describe InstructionSet do

    describe '.build_from_file' do
      let(:filename) do
        f = Tempfile.new('instructions')
        f.write("PLACE 0, 0, NORTH\n")
        f.write("MOVE\n")
        f.write("REPORT\n")
        f.rewind
        f
      end

      after :each do
        filename.close
        filename.unlink
      end

      it 'returns an InstructionSet' do
        expect(InstructionSet.build_from_file(filename)).to be_a InstructionSet
      end
    end

  end
end
