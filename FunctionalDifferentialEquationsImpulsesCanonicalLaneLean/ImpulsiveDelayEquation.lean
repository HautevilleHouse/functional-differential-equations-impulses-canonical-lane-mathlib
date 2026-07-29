import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure ImpulsiveDelayEquationPackage where
  stateSpace : Type u
  delay : ℝ ≥ 0
  impulseTimes : List ℝ
  impulseMap : stateSpace → stateSpace
  functionalF : (ℝ → stateSpace) → ℝ → stateSpace
  initialCondition : ℝ → stateSpace
  equationHolds : Prop
  impulseTimesDiscrete : Prop
  impulseMapContinuous : Prop
  functionalFContinuous : Prop

structure ImpulsiveDelayEquationEvidence (P : ImpulsiveDelayEquationPackage) where
  equationHoldsClosed : P.equationHolds
  impulseTimesDiscreteClosed : P.impulseTimesDiscrete
  impulseMapContinuousClosed : P.impulseMapContinuous
  functionalFContinuousClosed : P.functionalFContinuous

def ImpulsiveDelayEquationClosed (P : ImpulsiveDelayEquationPackage) : Prop :=
  P.equationHolds ∧ P.impulseTimesDiscrete ∧ P.impulseMapContinuous ∧ P.functionalFContinuous

theorem impulsive_delay_equation_closed_from_evidence (P : ImpulsiveDelayEquationPackage)
    (E : ImpulsiveDelayEquationEvidence P) : ImpulsiveDelayEquationClosed P := by
  exact And.intro E.equationHoldsClosed (And.intro E.impulseTimesDiscreteClosed
    (And.intro E.impulseMapContinuousClosed E.functionalFContinuousClosed))

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse