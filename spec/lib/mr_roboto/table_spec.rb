#encoding: utf-8

require_relative '../../spec_helper'
require 'mr_roboto/table'

module MrRoboto
  describe Table do

    let(:table) { Table.new(5, 5) }
    let(:robot) { double('Robot') }

    describe '#place' do
      context 'given a position within the table\'s constraints' do
        it 'places a given object at the position requested' do
          table.place(robot, 4, 2)
          expect(table[4, 2]).to eq(robot)
        end
      end
    end

    describe '#move' do
      context 'given that one space in the given direction will be a valid position' do
        it 'moves the robot one space forward in the given direction' do
          table.place(robot, 0, 0)
          table.move(robot, :north)
          expect(table.items[robot]).to eq({x: 0, y: 1})
        end
      end

      context 'given that one space in the given direction will not be a valid position' do
        it 'does nothing' do
          table.place(robot, 0, 0)
          table.move(robot, :south)
          expect(table.items[robot]).to eq({x: 0, y: 0})
        end
      end
    end

    describe '#position_of' do
      context 'given an item that is in it\'s items array' do
        it 'return that item\'s position' do
          table.place(robot,3,3)
          expect(table.position_of(robot)).to eq({x:3, y: 3})
        end
      end

      context 'given an item that is not in it\'s items array' do
        it 'returns nil' do
          expect(table.position_of(robot)).to be nil
        end
      end
    end

    describe '#valid_position?' do
      context 'given a valid position' do
        it 'is true' do
          expect(table.valid_position?(3,4)).to be true
        end
      end

      context 'given an invalid position' do
        it 'is false' do
          expect(table.valid_position?(34,-29)).to be false
        end
      end
    end

    describe '#[]' do
      context 'given a valid position' do
        it 'reports what is at the position given' do
          expect(table[0, 0]).to be nil
          table.place(robot, 0, 1)
          expect(table[0, 1]).to eq(robot)
        end
      end
      context 'given an invalid position' do
        it 'raises an error' do
          expect { table[-1,6] }.to raise_error
        end
      end
    end

  end
end
