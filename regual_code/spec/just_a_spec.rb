describe "coreutils & ruby" do
  it "should has equal pwd methods" do
    `pwd`.chop.should eql Dir.pwd
  end
end
