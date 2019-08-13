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

  # my_each_wth_index
  describe '#my_each_with_index' do
    let(:arr) { ['a', 'b', 'c'] }
    it 'should call the block one for each element and pass it as parameter' do
      expect{ arr.my_each_with_index { |element,index| puts "#{index}=>#{element}" } }.to output("0=>a\n1=>b\n2=>c\n").to_stdout
    end
  end

  # my_select
  describe '#my_select' do
    let(:arr) { [1, 2, 3, 4, 5] }
    it 'should return all elements of the enum for which the given block returns true' do
      expect(arr.my_select { |num| num.even? }).to eql([2, 4])
    end
  end

  # my_all?
  describe '#my_all?' do
    let(:arr) { [1,2,3,4,5] }
    it 'should return true if the given block return true for all the elements' do
      expect(arr.my_all? { |x| x < 6 }).to eql(true)
    end
    it 'should return false if the given block return false for one element at least' do
      expect(arr.my_all? { |x| 1 < x }).to eql(false)
    end
  end

  # my_any?
  describe '#my_any?' do
    let(:strArr) { %w[ant bear cat] }
    it 'should return true if word length is greater than or equal to 3' do
      expect(strArr.my_any? { |word| word.length >= 3 }).to eql(true)
    end
    it 'should return true if word length is greater than or equal to 4' do
      expect(strArr.my_any? { |word| word.length >= 4 }).to eql(true)
    end
  end

  # my_none?
  describe '#my_none?' do
    let(:arr) { [1,2,3,4,5] }
    it 'should return true if the given block return false for all the elements' do
      expect(arr.my_none? { |x| x > 6 }).to eql(true)
    end
    it 'should return false if the given block return true for one element at least' do
      expect(arr.my_none? { |x| 1 == x }).to eql(false)
    end
  end
  
  # my_count
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
