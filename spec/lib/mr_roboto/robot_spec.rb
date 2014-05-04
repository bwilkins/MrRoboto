#encoding: utf-8

require_relative '../../spec_helper'
require 'mr_roboto/robot'

module MrRoboto
  describe Robot do

    describe '#report' do
      let(:robot) { Robot.new }
      let(:report) { robot.report }

      context 'when no other instructions given' do
        it 'returns a no-instructions message' do
          expect(report).to eq 'No other instructions given!'
        end
      end

      context 'when given other instructions' do
        context 'but none of them is a \'place\' instruction' do
          it 'returns a no-instructions message' do
            expect(report).to eq 'No other instructions given!'
          end
        end

        it 'reports the current position and heading/facing of the robot' do
          skip
          robot.place(0,0,:north)
          expect(report).to eq '0,0,NORTH'
        end
      end

    end

    describe '#place' do
      let(:robot) { Robot.new }

      context 'when the position given is within the bounds of the table' do
        it 'places the robot on the table' do
          skip
          robot.place(4,2,:east)

        end
      end

    end

  end
end
