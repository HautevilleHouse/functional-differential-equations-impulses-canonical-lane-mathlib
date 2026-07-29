import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure PeriodicImpulsiveSolution where
  period : ℝ
  trajectory : ℝ → ℝⁿ
  impulseMap : ℝ → ℝⁿ → ℝⁿ
  periodicCondition : Prop
  impulsePeriodicity : Prop
  smoothnessOnIntervals : Prop

structure PeriodicEvidence (P : PeriodicImpulsiveSolution) where
  periodicConditionClosed : P.periodicCondition
  impulsePeriodicityClosed : P.impulsePeriodicity
  smoothnessOnIntervalsClosed : P.smoothnessOnIntervals

def PeriodicClosed (P : PeriodicImpulsiveSolution) : Prop :=
  P.periodicCondition ∧ P.impulsePeriodicity ∧ P.smoothnessOnIntervals

theorem periodic_closed_from_evidence
    (P : PeriodicImpulsiveSolution) (E : PeriodicEvidence P) :
    PeriodicClosed P := by
  exact And.intro E.periodicConditionClosed
    (And.intro E.impulsePeriodicityClosed E.smoothnessOnIntervalsClosed)

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse