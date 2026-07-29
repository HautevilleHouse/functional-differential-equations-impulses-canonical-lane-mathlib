import HautevilleHouse.FunctionalDifferentialEquationsImpulsesCanonicalLaneLean.ExistenceUniquenessImpulsive

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure LyapunovFunctionPackage {P : ImpulsiveDelayEquationPackage} where
  lyapunovFunction : P.stateSpace → ℝ
  positiveDefinite : Prop
  derivativeAlongSolutions : Prop
  impulseJumpsNonincreasing : Prop
  asymptoticStability : Prop

def LyapunovStabilityClosed {P : ImpulsiveDelayEquationPackage}
    (L : LyapunovFunctionPackage P) : Prop :=
  L.positiveDefinite ∧ L.derivativeAlongSolutions ∧ L.impulseJumpsNonincreasing ∧ L.asymptoticStability

structure LyapunovStabilityEvidence {P : ImpulsiveDelayEquationPackage}
    (L : LyapunovFunctionPackage P) where
  positiveDefiniteClosed : L.positiveDefinite
  derivativeAlongSolutionsClosed : L.derivativeAlongSolutions
  impulseJumpsNonincreasingClosed : L.impulseJumpsNonincreasing
  asymptoticStabilityClosed : L.asymptoticStability

theorem lyapunov_stability_closed_from_evidence {P : ImpulsiveDelayEquationPackage}
    (L : LyapunovFunctionPackage P) (E : LyapunovStabilityEvidence L) :
    LyapunovStabilityClosed L := by
  exact And.intro E.positiveDefiniteClosed (And.intro E.derivativeAlongSolutionsClosed
    (And.intro E.impulseJumpsNonincreasingClosed E.asymptoticStabilityClosed))

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse