import HautevilleHouse.FunctionalDifferentialEquationsImpulsesCanonicalLaneLean.ExistenceUniquenessImpulsive

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure PeriodicSolutionPackage {P : ImpulsiveDelayEquationPackage} where
  period : ℝ
  periodicOrbit : ℝ → P.stateSpace
  satisfiesEquation : Prop
  impulseTimesPeriodic : Prop
  orbitalStability : Prop

def PeriodicSolutionClosed {P : ImpulsiveDelayEquationPackage}
    (Per : PeriodicSolutionPackage P) : Prop :=
  Per.satisfiesEquation ∧ Per.impulseTimesPeriodic ∧ Per.orbitalStability

structure PeriodicSolutionEvidence {P : ImpulsiveDelayEquationPackage}
    (Per : PeriodicSolutionPackage P) where
  satisfiesEquationClosed : Per.satisfiesEquation
  impulseTimesPeriodicClosed : Per.impulseTimesPeriodic
  orbitalStabilityClosed : Per.orbitalStability

theorem periodic_solution_closed_from_evidence {P : ImpulsiveDelayEquationPackage}
    (Per : PeriodicSolutionPackage P) (E : PeriodicSolutionEvidence Per) :
    PeriodicSolutionClosed Per := by
  exact And.intro E.satisfiesEquationClosed (And.intro E.impulseTimesPeriodicClosed E.orbitalStabilityClosed)

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse