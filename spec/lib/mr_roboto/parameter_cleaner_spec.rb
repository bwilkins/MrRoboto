#encoding: utf-8

require_relative '../../spec_helper'
require 'mr_roboto/parameter_cleaner'

module MrRoboto
  describe ParameterCleaner do

    describe '.clean_parameters' do
      context 'given an array of parameters' do
        let(:parameters) { ['4', '2', 'EAST'] }
        let(:expected_output) { [4, 2, :east] }
        let(:cleaned_parameters) { ParameterCleaner.clean_parameters(parameters) }

        it 'returns a new array with each parameter cleaned' do
          expect(cleaned_parameters).to eq expected_output
        end

      end
    end

    describe '.clean_parameter' do
      let(:parameter) { nil }
      let(:cleaned_parameter) { ParameterCleaner.clean_parameter(parameter) }

      context 'given a digit parameter in a string' do
        let(:parameter) { '0' }
        let(:expected_output) { 0 }

        it 'returns the corresponding digit as an Integer' do
          expect(cleaned_parameter).to eq expected_output
        end
      end

      context 'given a word parameter in a string' do
        let(:parameter) { 'NORTH' }
        let(:expected_output) { :north }

        it 'returns the corresponding word as a symbol' do
          expect(cleaned_parameter).to eq expected_output
        end
      end

    end

  end
end
