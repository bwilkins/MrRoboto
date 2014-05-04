#encoding: utf-8

require_relative '../spec_helper'

describe 'MrRoboto' do

  context 'when given a non-existent file' do
    let(:args) { [input_filename] }
    let(:input_filename) { 'foobar' }


    it 'will execute and return the expected output' do
      expect(MrRoboto::Runner.new.run(args)).to == "No such file or directory #{input_filename}"
    end
  end

end
