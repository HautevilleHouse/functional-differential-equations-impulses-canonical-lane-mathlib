import FunctionalDifferentialEquationsImpulsesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

structure AdmissibleClass where
  object : FunctionalDifferentialAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FunctionalDifferentialWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse