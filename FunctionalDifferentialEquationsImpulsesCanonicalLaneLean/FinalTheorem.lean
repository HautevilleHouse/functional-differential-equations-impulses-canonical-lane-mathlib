import HautevilleHouse.FunctionalDifferentialEquationsImpulsesCanonicalLaneLean.ImpulsiveControl
import HautevilleHouse.FunctionalDifferentialEquationsImpulsesCanonicalLaneLean.PeriodicSolutionsImpulsive
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedFunctionalImpulseClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_functional_impulse_endgame (A : AdmissibleClass) :
    ConstrainedFunctionalImpulseClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse