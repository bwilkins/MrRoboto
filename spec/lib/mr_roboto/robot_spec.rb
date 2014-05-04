#encoding: utf-8

require_relative '../../spec_helper'
require 'mr_roboto/robot'

module MrRoboto
  describe Robot do
    let(:table) { double('Table') }
    let(:robot) { Robot.new(table) }

    before do
      allow(table).to receive(:place)
      allow(table).to receive(:move)
      allow(table).to receive(:position_of).with(robot)
    end

    describe '#report' do
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
          expect(table).to receive(:position_of).with(robot).and_return({x: 0, y: 0})
          robot.place(0,0,:north)
          expect(report).to eq '0,0,NORTH'
        end
      end

    end

    describe '#place' do

      context 'when the position given is within the bounds of the table' do
        it 'places the robot on the table' do
          expect(table).to receive(:place).with(4, 2)
          robot.place(4,2,:east)
        end
      end

    end

    describe '#move' do
      it 'asks the table to move it in the given heading' do
        robot.place(1, 2, :south)
        expect(table).to receive(:move).with(robot, :south)
        robot.move
      end
    end

  end
end
