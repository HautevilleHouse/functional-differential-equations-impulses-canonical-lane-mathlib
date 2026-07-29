import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure ImpulsiveEvolutionSystem where
  timeDomain : Type u
  stateSpace : Type v
  flowMapping : timeDomain → stateSpace → stateSpace
  impulseTimes : List timeDomain
  jumpMapping : timeDomain → stateSpace → stateSpace
  continuityOnIntervals : Prop
  jumpCondition : Prop

structure ImpulsiveEvolutionEvidence (S : ImpulsiveEvolutionSystem) where
  continuityOnIntervalsClosed : S.continuityOnIntervals
  jumpConditionClosed : S.jumpCondition

def ImpulsiveEvolutionClosed (S : ImpulsiveEvolutionSystem) : Prop :=
  S.continuityOnIntervals ∧ S.jumpCondition

theorem impulsive_evolution_closed_from_evidence
    (S : ImpulsiveEvolutionSystem) (E : ImpulsiveEvolutionEvidence S) :
    ImpulsiveEvolutionClosed S := by
  exact And.intro E.continuityOnIntervalsClosed E.jumpConditionClosed

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse