import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsImpulses.StabilityImpulse

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulses

structure OptimalControlPackage {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    {P : PiecewiseContinuityPackage S} {St : StabilityPackage P} where
  costFunctional : Type
  hjbEquation : Prop
  optimalityCondition : Prop
  costFunctionalTerm : costFunctional
  hjbEquationTerm : hjbEquation
  optimalityConditionTerm : optimalityCondition

structure OptimalControlEvidence {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    {P : PiecewiseContinuityPackage S} {St : StabilityPackage P}
    (O : OptimalControlPackage St) where
  hjbEquationClosed : O.hjbEquation
  optimalityConditionClosed : O.optimalityCondition

def OptimalControlClosed {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    {P : PiecewiseContinuityPackage S} {St : StabilityPackage P}
    (O : OptimalControlPackage St) : Prop :=
  O.hjbEquation ∧ O.optimalityCondition

theorem optimal_control_closed_from_evidence
    {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    {P : PiecewiseContinuityPackage S} {St : StabilityPackage P}
    (O : OptimalControlPackage St) (E : OptimalControlEvidence O) :
    OptimalControlClosed O := by
  exact And.intro E.hjbEquationClosed E.optimalityConditionClosed

end FunctionalDifferentialEquationsImpulses
end HautevilleHouse