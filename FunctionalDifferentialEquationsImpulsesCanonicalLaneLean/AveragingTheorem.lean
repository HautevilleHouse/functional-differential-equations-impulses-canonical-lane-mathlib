import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure AveragingSystem (X : StateSpace) where
  fastTimeScale : ℝ → X.carrier → X.carrier
  slowDrift : ℝ → X.carrier → X.carrier
  impulseMap : ℝ → X.carrier → X.carrier
  period : ℝ
  smallParameter : ℝ
  averagedVectorField : X.carrier → X.carrier
  approximationOrder : ℕ

structure AveragingTheoremCertificate (X : StateSpace) (A : AveragingSystem X) where
  existenceInterval : ℝ
  approximationBound : ∀ t ∈ Set.Icc 0 A.existenceInterval, ∥A.fastTimeScale t (x) - A.averagedVectorField (x)∥ ≤ A.smallParameter^A.approximationOrder
  impulseCorrection : ∀ t ∈ Set.Ioo 0 A.existenceInterval, if h : ∃ (n : ℕ), t = n * A.period then A.impulseMap t (x) = A.fastTimeScale t (x) + error else true
  stability : Prop

structure AveragingEvidence {X : StateSpace} {A : AveragingSystem X} (C : AveragingTheoremCertificate X A) where
  existenceIntervalClosed : C.existenceInterval > 0
  approximationBoundClosed : C.approximationBound
  impulseCorrectionClosed : C.impulseCorrection
  stabilityClosed : C.stability

def AveragingTheoremClosed {X : StateSpace} {A : AveragingSystem X} (C : AveragingTheoremCertificate X A) : Prop :=
  C.approximationBound ∧ C.impulseCorrection ∧ C.stability

theorem averaging_theorem_closed_from_evidence {X : StateSpace} {A : AveragingSystem X} (C : AveragingTheoremCertificate X A) (E : AveragingEvidence C) : AveragingTheoremClosed C := by
  exact And.intro E.approximationBoundClosed (And.intro E.impulseCorrectionClosed E.stabilityClosed)

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse