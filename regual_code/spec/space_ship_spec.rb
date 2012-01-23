require File.join(File.dirname(__FILE__), '../space_ship')

describe SpaceShip do
  subject { SpaceShip.new }

  it "should be able to fly" do
    subject.should respond_to :fly
  end

  it "should not fly without a target" do
    expect { subject.fly }.to raise_error( TargetNotSet ) 
  end

  it "should update location after the flight" do
    subject.target = "Sirius"
    subject.fly
    # Yoda style
    (subject.location == "Sirius").should be
  end

  describe "targeting system" do
    it "should be able to set target" do
      subject.should respond_to( :target= ).with(1).argument
    end

    it "should be able return target" do
      subject.should respond_to :target
      subject.target.should be_nil
    end

    it "should return target that we set before" do
      subject.target = "Arcturus"
      subject.target.should eql "Arcturus"
    end

    pending "should check for known space objects when setting target"
  end

  describe "navigation system" do
    # we set 'subject' earlyer so we can just call 'should'
    it { should respond_to :location }
    it { should_not respond_to :location= }
    it "should have location set to 'Earth' as default" do
      subject.location.should eql "Earth"
    end
  end
  
  describe "cockpit" do
    it "should be able to take a pilot" do
      should respond_to( :take_a_pilot ).with(1).argument
    end

    # Mocking
    it "should force pilot to yell" do
      Human.any_instance.should_receive(:yell).once
      subject.take_a_pilot(Human.new)
    end

    it "should return pilot's yell" do
      human = Human.new
      human.stub("yell").with("i'm in").and_return("oh my")
      subject.take_a_pilot(human).should eql "oh my"
      subject.take_a_pilot(Human.new).should eql "i'm in"
    end
  end
end
