#encoding: utf-8

require_relative '../spec_helper'

require 'mr_roboto/runner'

describe MrRoboto::Runner do

  let(:args) { [input_file] }
  let(:input_file) { 'foobar' }

  context 'when given a non-existent file' do
    it 'will return a file-missing error' do
      expect(described_class.new.run(args)).to eq "No such file or directory #{input_file}"
    end
  end

  context 'when given a file with instructions' do
    ['robot_test_01', 'robot_test_02', 'robot_test_03'].each do |testname|
      let(:input_file)  { File.join(File.dirname(__FILE__),"#{testname}.input") }
      let(:output_file) { File.join(File.dirname(__FILE__),"#{testname}.output") }

      let(:expected_output) { File.read(output_file).chomp }

      it "reads that file (#{testname}.input) and returns the expected output" do
        expect(described_class.new.run(args)).to eq expected_output
      end

    end
  end

end
