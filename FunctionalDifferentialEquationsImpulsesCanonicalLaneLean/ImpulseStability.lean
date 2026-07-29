import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure LyapunovFunction (X : StateSpace) where
  V : X.carrier → ℝ
  positiveDefinite : V 0 = 0 ∧ ∀ x : X.carrier, x ≠ 0 → V x > 0
  decrescent : Prop
  derivativeAlongFlow : ℝ → X.carrier → ℝ

definition derivativeAlongFlow (L : LyapunovFunction X) (t : ℝ) (x : X.carrier) : ℝ :=
  L.derivativeAlongFlow t x

structure ImpulseStabilityCertificate (X : StateSpace) (eq : ImpulsiveDifferentialEquation X) where
  Lyapunov : LyapunovFunction X
  derivativeBound : ∀ t : ℝ, ∀ x : X.carrier, Lyapunov.derivativeAlongFlow t x ≤ 0
  jumpStability : ∀ t : Set.mem eq.impulseTimes t, ∀ x : X.carrier, Lyapunov.V (eq.jump t x) ≤ Lyapunov.V x
  asymptoticStability : Prop
  exponentialStability : Prop

structure ImpulseStabilityEvidence {X : StateSpace} {eq : ImpulsiveDifferentialEquation X} (C : ImpulseStabilityCertificate X eq) where
  derivativeBoundClosed : C.derivativeBound
  jumpStabilityClosed : C.jumpStability
  asymptoticStabilityClosed : C.asymptoticStability
  exponentialStabilityClosed : C.exponentialStability

def ImpulseStabilityClosed {X : StateSpace} {eq : ImpulsiveDifferentialEquation X} (C : ImpulseStabilityCertificate X eq) : Prop :=
  C.derivativeBound ∧ C.jumpStability ∧ C.asymptoticStability ∧ C.exponentialStability

theorem impulse_stability_closed_from_evidence {X : StateSpace} {eq : ImpulsiveDifferentialEquation X} (C : ImpulseStabilityCertificate X eq) (E : ImpulseStabilityEvidence C) : ImpulseStabilityClosed C := by
  exact And.intro E.derivativeBoundClosed (And.intro E.jumpStabilityClosed (And.intro E.asymptoticStabilityClosed E.exponentialStabilityClosed))

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse