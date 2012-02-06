root = File.expand_path('../..', __FILE__)
require File.join(root, %w[lib true-random])

describe TrueRandom::Random do

  before :each do
    @rnd = TrueRandom::Random.new
  end

  it "should be true" do
  	@rnd.integer.should_not == false
  end

  it "should be Fixnum" do
  	result = @rnd.integer 1
  	result.class.should == Fixnum
  end

  it "should be Array" do
  	result = @rnd.integer 10
  	result.count.should == 10
  end

end
