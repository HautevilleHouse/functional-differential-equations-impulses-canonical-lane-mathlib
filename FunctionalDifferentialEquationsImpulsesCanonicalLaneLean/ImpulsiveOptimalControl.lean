import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure ImpulsiveOptimalControlProblem where
  costFunctional : Prop
  dynamicsWithJumps : Prop
  controlConstraints : Prop
  impulseTimesDecision : Prop
  optimalityConditions : Prop

structure OptimalityEvidence (O : ImpulsiveOptimalControlProblem) where
  costFunctionalClosed : O.costFunctional
  dynamicsWithJumpsClosed : O.dynamicsWithJumps
  controlConstraintsClosed : O.controlConstraints
  impulseTimesDecisionClosed : O.impulseTimesDecision
  optimalityConditionsClosed : O.optimalityConditions

def OptimalityClosed (O : ImpulsiveOptimalControlProblem) : Prop :=
  O.costFunctional ∧ O.dynamicsWithJumps ∧ O.controlConstraints ∧
  O.impulseTimesDecision ∧ O.optimalityConditions

theorem optimality_closed_from_evidence
    (O : ImpulsiveOptimalControlProblem) (E : OptimalityEvidence O) :
    OptimalityClosed O := by
  exact And.intro E.costFunctionalClosed
    (And.intro E.dynamicsWithJumpsClosed
      (And.intro E.controlConstraintsClosed
        (And.intro E.impulseTimesDecisionClosed E.optimalityConditionsClosed)))

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse