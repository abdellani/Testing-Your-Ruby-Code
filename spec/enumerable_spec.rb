require './enumerable/main.rb'

RSpec.describe "Enumerable" do
  describe "#my_count" do
    let(:arr){[1,2,4,2]}
    it "should return the size of the array when called without arguments" do 
      expect(arr.my_count).to eql(4)
    end
    it "should return the count of elements which equal the argument provided" do
      expect(arr.my_count(2)).to eql(2)
    end
    it "should return the count of elements for whick the given block returns true" do
      expect(arr.my_count{|x| x%2==0 }).to eql(3)
    end
  end
end