import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsImpulses.ImpulseDifferentialSystem

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulses

structure PiecewiseContinuityPackage {I : ImpulseTimeDomain} (S : ImpulseSystem I) where
  continuousOnIntervals : Prop
  jumpDiscontinuities : Prop
  leftRightLimits : Prop
  continuousOnIntervalsTerm : continuousOnIntervals
  jumpDiscontinuitiesTerm : jumpDiscontinuities
  leftRightLimitsTerm : leftRightLimits

structure PiecewiseContinuityEvidence {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    (P : PiecewiseContinuityPackage S) where
  continuousOnIntervalsClosed : P.continuousOnIntervals
  jumpDiscontinuitiesClosed : P.jumpDiscontinuities
  leftRightLimitsClosed : P.leftRightLimits

def PiecewiseContinuityClosed {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    (P : PiecewiseContinuityPackage S) : Prop :=
  P.continuousOnIntervals ∧ P.jumpDiscontinuities ∧ P.leftRightLimits

theorem piecewise_continuity_closed_from_evidence
    {I : ImpulseTimeDomain} {S : ImpulseSystem I}
    (P : PiecewiseContinuityPackage S) (E : PiecewiseContinuityEvidence P) :
    PiecewiseContinuityClosed P := by
  exact And.intro E.continuousOnIntervalsClosed
    (And.intro E.jumpDiscontinuitiesClosed E.leftRightLimitsClosed)

end FunctionalDifferentialEquationsImpulses
end HautevilleHouse