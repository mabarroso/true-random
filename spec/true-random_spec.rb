root = File.expand_path('../..', __FILE__)
require File.join(root, %w[lib true_random])

describe TrueRandom::Random do

  before :each do
    @rnd = TrueRandom::Random.new
  end

  it "should be true" do
  	@rnd.integer.should_not == false
  end

  it "should be true" do
  	result = @rnd.integer 1
  	result.class.should == Fixnum
  end

end
