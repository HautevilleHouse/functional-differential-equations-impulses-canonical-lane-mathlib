import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure LyapunovFunctionData where
  functionDefined : Prop
  positiveDefinite : Prop
  derivativeAlongFlow : Prop
  jumpDecrease : Prop

structure LyapunovEvidence (L : LyapunovFunctionData) where
  functionDefinedClosed : L.functionDefined
  positiveDefiniteClosed : L.positiveDefinite
  derivativeAlongFlowClosed : L.derivativeAlongFlow
  jumpDecreaseClosed : L.jumpDecrease

def LyapunovClosed (L : LyapunovFunctionData) : Prop :=
  L.functionDefined ∧ L.positiveDefinite ∧ L.derivativeAlongFlow ∧ L.jumpDecrease

theorem lyapunov_closed_from_evidence
    (L : LyapunovFunctionData) (E : LyapunovEvidence L) :
    LyapunovClosed L := by
  exact And.intro E.functionDefinedClosed
    (And.intro E.positiveDefiniteClosed
      (And.intro E.derivativeAlongFlowClosed E.jumpDecreaseClosed))

def BaseSolutionStable (L : LyapunovFunctionData) : Prop :=
  LyapunovClosed L

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse