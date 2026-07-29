import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure DiscontinuousVectorField (X : StateSpace) where
  f : ℝ → X.carrier → Set (X.carrier)
  upperSemicontinuous : Prop
  convexValues : ∀ t : ℝ, ∀ x : X.carrier, Convex ℝ (f t x)
  boundedValues : Prop
  measurableInTime : Prop

structure FilippovSolution (X : StateSpace) (V : DiscontinuousVectorField X) where
  solution : ℝ → X.carrier
  initialCondition : solution 0 = 0
  differentialInclusion : ∀ᵐ t : ℝ, solution.deriv t ∈ V.f t (solution t)
  absolutelyContinuous : Prop
  impulseTimes : Set ℝ
  jumpCondition : ∀ t : impulseTimes, solution t = V.f t (solution t) -- simplified

structure FilippovEvidence {X : StateSpace} {V : DiscontinuousVectorField X} (F : FilippovSolution X V) where
  initialConditionClosed : F.initialCondition
  differentialInclusionClosed : F.differentialInclusion
  absolutelyContinuousClosed : F.absolutelyContinuous
  jumpConditionClosed : F.jumpCondition

def FilippovSolutionClosed {X : StateSpace} {V : DiscontinuousVectorField X} (F : FilippovSolution X V) : Prop :=
  F.initialCondition ∧ F.differentialInclusion ∧ F.absolutelyContinuous ∧ F.jumpCondition

theorem filippov_solution_closed_from_evidence {X : StateSpace} {V : DiscontinuousVectorField X} (F : FilippovSolution X V) (E : FilippovEvidence F) : FilippovSolutionClosed F := by
  exact And.intro E.initialConditionClosed (And.intro E.differentialInclusionClosed (And.intro E.absolutelyContinuousClosed E.jumpConditionClosed))

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse