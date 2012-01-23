# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), '../human')

describe Human do
  describe "mouth" do
    it "should be able to yell something" do
      Human.new.should respond_to(:yell).with(1).argument
    end
  end
  context "hands" do
    it { Human.new.should respond_to(:clap) }
  end
end
