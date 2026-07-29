import HautevilleHouse.FunctionalDifferentialEquationsImpulsesCanonicalLaneLean.ImpulsiveDelayEquation

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure ExistenceUniquenessPackage {P : ImpulsiveDelayEquationPackage} where
  localExistence : Prop
  uniquenessOnOverlap : Prop
  continuationCriterion : Prop
  impulseContinuationCondition : Prop

def ExistenceUniquenessClosed {P : ImpulsiveDelayEquationPackage}
    (E : ExistenceUniquenessPackage P) : Prop :=
  E.localExistence ∧ E.uniquenessOnOverlap ∧ E.continuationCriterion ∧ E.impulseContinuationCondition

structure ExistenceUniquenessEvidence {P : ImpulsiveDelayEquationPackage}
    (E : ExistenceUniquenessPackage P) where
  localExistenceClosed : E.localExistence
  uniquenessOnOverlapClosed : E.uniquenessOnOverlap
  continuationCriterionClosed : E.continuationCriterion
  impulseContinuationConditionClosed : E.impulseContinuationCondition

theorem existence_uniqueness_closed_from_evidence {P : ImpulsiveDelayEquationPackage}
    (E : ExistenceUniquenessPackage P) (Ev : ExistenceUniquenessEvidence E) :
    ExistenceUniquenessClosed E := by
  exact And.intro Ev.localExistenceClosed (And.intro Ev.uniquenessOnOverlapClosed
    (And.intro Ev.continuationCriterionClosed Ev.impulseContinuationConditionClosed))

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse