# frozen_string_literal: true

require './enumerable/main.rb'

RSpec.describe 'Enumerable' do
  # my_each
  describe '#my_each' do
    let(:arr) { ['a', 'b', 'c'] }
    it 'should call the block once for each element and pass it as parameter' do
      expect { arr.my_each { |x| print x, ' -- ' } }.to output('a -- b -- c -- ').to_stdout
    end

    it 'should return an enumerator if no block is given' do
      expect(arr.my_each.is_a?(Enumerable)).to be(true)
    end
  end

  describe '#my_each_with_index' do
    let(:arr) { ['a', 'b', 'c'] }
    it 'should call the block one for each element and pass it as parameter' do
      expect{ arr.my_each_with_index { |element,index| puts "#{index}=>#{element}" } }.to output("0=>a\n1=>b\n2=>c\n").to_stdout
    end
  end

  describe '#my_count' do
    let(:arr) { [1, 2, 4, 2] }
    it 'should return the size of the array when called without arguments' do
      expect(arr.my_count).to eql(4)
    end

    it 'should return the count of elements which equal the argument provided' do
      expect(arr.my_count(2)).to eql(2)
    end

    it 'should return the count of elements for whick the given block returns true' do
      expect(arr.my_count { |x| x.even? }).to eql(3)
    end
  end
end
