import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure StateSpace where
  carrier : Type u
  norm : carrier → ℝ
  normedAddCommGroup : NormedAddCommGroup carrier

definition normedAddCommGroup (S : StateSpace) : NormedAddCommGroup S.carrier := S.normedAddCommGroup

structure ImpulsiveDifferentialEquation (X : StateSpace) where
  timeDomain : Set ℝ
  impulseTimes : Set ℝ
  flow : ℝ → X.carrier → X.carrier
  jump : ℝ → X.carrier → X.carrier
  transitionCondition : Prop
  initialCondition : X.carrier
  solutionOnInterval : ℝ → X.carrier

structure ImpulsiveDEEvidence {X : StateSpace} (eq : ImpulsiveDifferentialEquation X) where
  transitionConditionClosed : eq.transitionCondition
  initialConditionClosed : eq.initialCondition = eq.solutionOnInterval 0
  solutionMatching : ∀ t : ℝ, eq.solutionOnInterval t = if h : t ∈ eq.timeDomain then eq.flow t (eq.solutionOnInterval 0) else eq.jump t (eq.solutionOnInterval 0)

def ImpulsiveDEClosed {X : StateSpace} (eq : ImpulsiveDifferentialEquation X) : Prop :=
  eq.transitionCondition ∧ ∃ sol : ℝ → X.carrier, sol 0 = eq.initialCondition ∧ ∀ t : ℝ, sol t = if h : t ∈ eq.timeDomain then eq.flow t (eq.initialCondition) else eq.jump t (eq.initialCondition)

theorem impulsive_de_closed_from_evidence {X : StateSpace} (eq : ImpulsiveDifferentialEquation X) (E : ImpulsiveDEEvidence eq) : ImpulsiveDEClosed eq := by
  refine And.intro E.transitionConditionClosed ?_
  refine Exists.intro eq.solutionOnInterval ?_
  exact And.intro E.initialConditionClosed E.solutionMatching

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse