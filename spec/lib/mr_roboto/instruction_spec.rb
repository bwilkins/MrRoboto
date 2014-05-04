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

    describe '.build_from_string' do
      context "given an input string" do
        let(:input_string) { nil }
        let(:instruction) { Instruction.build_from_string(input_string) }

        context 'with no parameters' do
          let(:input_string) { 'MOVE' }
          let(:expected_command) { :move }

          it 'returns an Instruction' do
            expect(instruction).to be_a Instruction
          end

          it 'contains the correct command as a lower-case symbol' do
            expect(instruction.command).to eq expected_command
          end

          it 'contains an empty parameters array' do
            expect(instruction.parameters).to be_empty
          end
        end

        context 'with parameters' do
          let(:input_string) { 'PLACE 0,0,NORTH' }
          let(:expected_command) { :place }
          let(:expected_parameters) { [0,0,:north] }

          it 'returns an Instruction' do
            expect(instruction).to be_a Instruction
          end

          it 'contains the correct command as a lower-case symbol' do
            expect(instruction.command).to eq expected_command
          end

          it 'has three members in the parameters array' do
            expect(instruction.parameters).to have(3).parameters
            expect(instruction.parameters).to eq expected_parameters
          end
        end

      end
    end

  end
end
