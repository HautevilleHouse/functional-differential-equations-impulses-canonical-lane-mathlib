import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure ControlledImpulsiveSystem where
  controlSpace : Type u
  admissibleControls : Prop
  controlledFlow : Prop
  impulseControlCoupling : Prop
  reachableSet : Prop

structure ControllabilityEvidence (C : ControlledImpulsiveSystem) where
  admissibleControlsClosed : C.admissibleControls
  controlledFlowClosed : C.controlledFlow
  impulseControlCouplingClosed : C.impulseControlCoupling
  reachableSetClosed : C.reachableSet

def ControllabilityClosed (C : ControlledImpulsiveSystem) : Prop :=
  C.admissibleControls ∧ C.controlledFlow ∧ C.impulseControlCoupling ∧ C.reachableSet

theorem controllability_closed_from_evidence
    (C : ControlledImpulsiveSystem) (E : ControllabilityEvidence C) :
    ControllabilityClosed C := by
  exact And.intro E.admissibleControlsClosed
    (And.intro E.controlledFlowClosed
      (And.intro E.impulseControlCouplingClosed E.reachableSetClosed))

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse