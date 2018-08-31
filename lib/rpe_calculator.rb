class RpeCalculator
  HALF_RANGE = [98, 94, 91, 88, 85, 82, 80, 77, 75, 72, 69, 67, 64]
  FULL_RANGE = [100, 96, 92, 89, 86, 84, 81, 79, 76, 74, 71, 68, 65]
  RPE_TO_REPS_MAPPING = {
    6.5 => HALF_RANGE[3..12],
    7.0 => FULL_RANGE[3..12],
    7.5 => HALF_RANGE[2..11],
    8.0 => FULL_RANGE[2..11],
    8.5 => HALF_RANGE[1..10],
    9.0 => FULL_RANGE[1..10],
    9.5 => HALF_RANGE[0..9],
    10.0 => FULL_RANGE[0..9],
  }

  def self.estimate_one_rep_max(weight:, reps:, rpe:)
    multiplier = 100.0 / percentage_of_e1rm(rpe, reps)
    (weight * multiplier).round
  end

  def self.estimate_lift(e1rm:, reps:, rpe:)
    multiplier = percentage_of_e1rm(rpe, reps) / 100.0
    (e1rm * multiplier).round
  end

  private

  def self.percentage_of_e1rm(rpe, reps)
    RPE_TO_REPS_MAPPING[rpe.to_f][reps - 1]
  end
end
