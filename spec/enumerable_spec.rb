# frozen_string_literal: true

require './enumerable/main.rb'

RSpec.describe 'Enumerable' do
  let(:arr) { [1, 2, 3, 4, 5] }
  let(:str_arr) { %w[a b c] }

  # my_each
  describe '#my_each' do
    it 'should call the block once for each element and pass it as parameter' do
      expect { str_arr.my_each { |x| print x, ' -- ' } }.to output('a -- b -- c -- ').to_stdout
    end

    it 'should return an enumerator if no block is given' do
      expect(str_arr.my_each.is_a?(Enumerable)).to be(true)
    end
  end

  # my_each_wth_index
  describe '#my_each_with_index' do
    it 'should call the block one for each element and pass it as parameter' do
      expect { str_arr.my_each_with_index { |element, index| puts "#{index}=>#{element}" } }
        .to output("0=>a\n1=>b\n2=>c\n").to_stdout
    end
    it 'should return an enumerator if no block is given' do
      expect(str_arr.my_each_with_index.is_a?(Enumerable)).to be(true)
    end
  end

  # my_select
  describe '#my_select' do
    it 'should return all even elements from the array' do
      expect(arr.my_select(&:even?)).to eql([2, 4])
    end
    it 'should return all odd elements from the array' do
      expect(arr.my_select(&:odd?)).to eql([1, 3, 5])
    end
  end

  # my_all?
  describe '#my_all?' do
    it 'should return true if the given block return true for all the elements' do
      expect(arr.my_all? { |x| x < 6 }).to eql(true)
    end
    it 'should return false if the given block return false for one element at least' do
      expect(arr.my_all? { |x| x > 1 }).to eql(false)
    end
  end

  # my_any?
  describe '#my_any?' do
    let(:str_arr) { %w[ant bear cat] }
    it 'should return true if word length is greater than or equal to 3' do
      expect(str_arr.my_any? { |word| word.length >= 3 }).to eql(true)
    end
    it 'should return true if word length is greater than or equal to 4' do
      expect(str_arr.my_any? { |word| word.length >= 4 }).to eql(true)
    end
  end

  # my_none?
  describe '#my_none?' do
    it 'should return true if the given block return false for all the elements' do
      expect(arr.my_none? { |x| x > 6 }).to eql(true)
    end
    it 'should return false if the given block return true for one element at least' do
      expect(arr.my_none? { |x| x == 1 }).to eql(false)
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

    it 'should return the count of elements for which the given block returns true' do
      expect(arr.my_count(&:even?)).to eql(3)
    end
  end

  # my_map
  describe '#my_map' do
    it 'should return an array where each element is multiplied by 2' do
      expect(arr.my_map { |x| x * 2 }).to eql([2, 4, 6, 8, 10])
    end
    it 'should return the specified string for each element' do
      expect(arr.my_map { 'cat' }).to eql(%w[cat cat cat cat cat])
    end
  end

  # my_inject
  describe '#my_inject' do
    it 'should return the sum of all the elements of array' do
      expect(arr.my_inject { |sum, element| sum + element }).to eql(15)
    end
    it 'should return the sum of all the elements of array plus the argument' do
      expect(arr.my_inject(5) { |sum, element| sum + element }).to eql(20)
    end
  end
end
