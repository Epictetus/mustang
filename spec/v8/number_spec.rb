require File.dirname(__FILE__) + '/../spec_helper'

describe V8::Number do 
  subject { V8::Number }
  setup_context
  
  it "inherits V8::Value" do
    subject.new(10.5).should be_kind_of(V8::Value)
  end

  describe ".new" do
    it "creates new v8 number based on passed value" do
      subject.new(10.5).should == 10.5
      subject.new(-10.5).should == -10.5
    end
  end

  describe "#to_i" do
    it "returns fixnum value of referenced number" do
      subject.new(10.5).to_i.should == 10
    end
  end

  describe "an instance" do
    it "is comparable" do
      num = subject.new(10.5)
      num.should == 10.5
      num.should_not == 20.5
      num.should > 5.5
      num.should < 15.5
      num.should <= 10.5
      num.should >= 10.5
    end
    
    it "is delegated properly" do
      num = subject.new(3.4)
      num.delegate.should == num.to_f
    end
  end
end
