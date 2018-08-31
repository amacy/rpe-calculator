require "minitest/autorun"
require_relative "../lib/rpe_calculator"

describe RpeCalculator do
  before do
    @rpe_calculator = RpeCalculator
  end

  describe ".estimate_one_rep_max" do
    it "calculates the e1rm based on weight, reps and rpe" do
      @rpe_calculator.estimate_one_rep_max(weight: 100, reps: 5, rpe: 8).must_equal 123
    end
  end

  describe ".estimate_lift" do
    it "calculates the weight based on e1rm, reps and rpe" do
      @rpe_calculator.estimate_lift(e1rm: 100, reps: 5, rpe: 8).must_equal 81
    end
  end
end
