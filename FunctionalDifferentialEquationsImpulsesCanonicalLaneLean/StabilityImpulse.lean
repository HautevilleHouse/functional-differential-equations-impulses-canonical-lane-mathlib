import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsImpulses.PiecewiseContinuity

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulses

structure StabilityPackage {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    (P : PiecewiseContinuityPackage S) where
  lyapunovFunction : Type
  impulsiveLyapunovCondition : Prop
  asymptoticStability : Prop
  lyapunovFunctionTerm : lyapunovFunction
  impulsiveLyapunovConditionTerm : impulsiveLyapunovCondition
  asymptoticStabilityTerm : asymptoticStability

structure StabilityEvidence {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    {P : PiecewiseContinuityPackage S} (St : StabilityPackage P) where
  impulsiveLyapunovConditionClosed : St.impulsiveLyapunovCondition
  asymptoticStabilityClosed : St.asymptoticStability

def StabilityClosed {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    {P : PiecewiseContinuityPackage S} (St : StabilityPackage P) : Prop :=
  St.impulsiveLyapunovCondition ∧ St.asymptoticStability

theorem stability_closed_from_evidence
    {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    {P : PiecewiseContinuityPackage S} (St : StabilityPackage P)
    (E : StabilityEvidence St) : StabilityClosed St := by
  exact And.intro E.impulsiveLyapunovConditionClosed E.asymptoticStabilityClosed

end FunctionalDifferentialEquationsImpulses
end HautevilleHouse