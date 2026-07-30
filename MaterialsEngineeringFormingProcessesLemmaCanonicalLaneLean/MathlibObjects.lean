import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MaterialSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MaterialAdmittedObject where
  space : MaterialSpace
  threeDimensional : Prop
  isotropicHardening : Prop
  vonMisesYield : Prop
  constitutiveModel : Type
  constitutiveSmooth : TopologicalSpace constitutiveModel
  yieldSurfaceClosed : Prop
  conclusion : yieldSurfaceClosed

structure MaterialEndgameState where
  object : MaterialAdmittedObject

def MaterialWitnessClosed (O : MaterialAdmittedObject) : Prop :=
  O.yieldSurfaceClosed

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse