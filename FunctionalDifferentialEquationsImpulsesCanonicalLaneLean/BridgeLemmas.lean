import FunctionalDifferentialEquationsImpulsesCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsImpulsesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FunctionalDifferentialWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FunctionalDifferentialEquationsImpulsesCanonicalLaneLean
end HautevilleHouse