#encoding: utf-8

require_relative '../../spec_helper'
require 'mr_roboto/instruction'

module MrRoboto
  describe Instruction do

    describe '#initialize' do
      let(:command) { :place }
      let(:parameters) { [0,0,:north] }
      let(:instruction) { Instruction.new(command, parameters) }

      it 'stores the given command and parameters' do
        expect(instruction.command).to eq(command)
        expect(instruction.parameters).to eq(parameters)
      end
    end

    describe '.build_from_string'

  end
end
