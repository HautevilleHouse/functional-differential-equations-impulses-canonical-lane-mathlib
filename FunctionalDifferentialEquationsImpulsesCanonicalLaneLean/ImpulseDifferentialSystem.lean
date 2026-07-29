import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulses

structure ImpulseTimeDomain where
  Time : Type
  impulseTimes : List Time
  continuityIntervals : List (Time × Time)
  impulseTimesFinite : Prop
  impulseTimesFiniteTerm : impulseTimesFinite

structure ImpulseSystem (I : ImpulseTimeDomain) where
  flowMap : I.Time → I.Time → Type
  jumpMap : I.Time → I.Time → Type
  flowEquation : Prop
  jumpEquation : Prop
  flowEquationTerm : flowEquation
  jumpEquationTerm : jumpEquation

structure ImpulseSystemEvidence {I : ImpulseTimeDomain} (S : ImpulseSystem I) where
  flowEquationClosed : S.flowEquation
  jumpEquationClosed : S.jumpEquation

def ImpulseSystemClosed {I : ImpulseTimeDomain} (S : ImpulseSystem I) : Prop :=
  S.flowEquation ∧ S.jumpEquation

theorem impulse_system_closed_from_evidence
    {I : ImpulseTimeDomain} (S : ImpulseSystem I) (E : ImpulseSystemEvidence S) :
    ImpulseSystemClosed S := by
  exact And.intro E.flowEquationClosed E.jumpEquationClosed

end FunctionalDifferentialEquationsImpulses
end HautevilleHouse