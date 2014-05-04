#encoding: utf-8

require_relative '../spec_helper'

require 'mr_roboto/runner'

describe MrRoboto::Runner do

  context 'when given a non-existent file' do
    let(:args) { [input_filename] }
    let(:input_filename) { 'foobar' }


    it 'will return a file-missing error' do
      expect(MrRoboto::Runner.new.run(args)).to eq "No such file or directory #{input_filename}"
    end
  end

end
