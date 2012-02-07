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

  it "should be Array for sequence" do
  	result = @rnd.sequence 10, 15
  	result.count.should == 6
  end

  it "should be String" do
  	result = @rnd.string
  	result.class.should == String
  end

  it "should be Array for string" do
  	result = @rnd.string 5
  	result.count.should == 5
  end

  it "should be Fixnum for quota" do
  	result = @rnd.quota
  	result.class.should == Fixnum
  end

end
