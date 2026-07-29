import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure ControlSystem (X : StateSpace) (U : Type u) where
  drift : ℝ → X.carrier → U → X.carrier
  impulseControl : ℝ → X.carrier → U → X.carrier
  costFunctional : (ℝ → X.carrier) → (ℝ → U) → ℝ
  runningCost : ℝ → X.carrier → U → ℝ
  terminalCost : X.carrier → ℝ
  impulseCost : ℝ → X.carrier → U → ℝ

structure ImpulseOptimalControlProblem (X : StateSpace) (U : Type u) (sys : ControlSystem X U) where
  timeHorizon : ℝ
  initialCondition : X.carrier
  admissibleControls : Set (ℝ → U)
  stateConstraints : Set (X.carrier)
  impulseTimes : Set ℝ

structure ImpulseHamiltonian (X : StateSpace) (U : Type u) (sys : ControlSystem X U) where
  H : ℝ → X.carrier → (X.carrier → ℝ) → U → ℝ
  adjointEquation : Prop
  maximalityCondition : Prop
  jumpCondition : Prop
  transversalityCondition : Prop

structure ImpulseOptimalControlEvidence {X : StateSpace} {U : Type u} {sys : ControlSystem X U} {prob : ImpulseOptimalControlProblem X U sys} {H : ImpulseHamiltonian X U sys} where
  adjointEquationClosed : H.adjointEquation
  maximalityConditionClosed : H.maximalityCondition
  jumpConditionClosed : H.jumpCondition
  transversalityConditionClosed : H.transversalityCondition

def ImpulseOptimalControlClosed {X : StateSpace} {U : Type u} {sys : ControlSystem X U} {prob : ImpulseOptimalControlProblem X U sys} {H : ImpulseHamiltonian X U sys} : Prop :=
  H.adjointEquation ∧ H.maximalityCondition ∧ H.jumpCondition ∧ H.transversalityCondition

theorem impulse_optimal_control_closed_from_evidence {X : StateSpace} {U : Type u} {sys : ControlSystem X U} {prob : ImpulseOptimalControlProblem X U sys} {H : ImpulseHamiltonian X U sys} (E : ImpulseOptimalControlEvidence H) : ImpulseOptimalControlClosed H := by
  exact And.intro E.adjointEquationClosed (And.intro E.maximalityConditionClosed (And.intro E.jumpConditionClosed E.transversalityConditionClosed))

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse