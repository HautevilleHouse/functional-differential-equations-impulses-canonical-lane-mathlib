import HautevilleHouse.FunctionalDifferentialEquationsImpulsesCanonicalLaneLean.ImpulsiveStability

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure ControlPackage {P : ImpulsiveDelayEquationPackage} where
  controlSet : Type u
  admissibleControls : P.stateSpace → controlSet → Prop
  controlledDynamics : (ℝ → P.stateSpace) → (ℝ → controlSet) → ℝ → P.stateSpace
  reachableSet : Set P.stateSpace
  optimalControlExists : Prop
  impulseConstraints : Prop

def ControlClosed {P : ImpulsiveDelayEquationPackage} (C : ControlPackage P) : Prop :=
  C.optimalControlExists ∧ C.impulseConstraints

structure ControlEvidence {P : ImpulsiveDelayEquationPackage} (C : ControlPackage P) where
  optimalControlExistsClosed : C.optimalControlExists
  impulseConstraintsClosed : C.impulseConstraints

theorem control_closed_from_evidence {P : ImpulsiveDelayEquationPackage}
    (C : ControlPackage P) (E : ControlEvidence C) : ControlClosed C := by
  exact And.intro E.optimalControlExistsClosed E.impulseConstraintsClosed

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse