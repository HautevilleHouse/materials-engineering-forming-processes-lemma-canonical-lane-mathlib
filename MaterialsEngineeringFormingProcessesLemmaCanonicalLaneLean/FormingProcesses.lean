import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure FormingProcessPackage where
  processType : Type u
  workMaterial : Type v
  temperature : Prop
  strainRate : Prop
  flowStress : Prop
  frictionModel : Prop
  deformationZone : Prop

structure FormingProcessEvidence (F : FormingProcessPackage) where
  temperatureClosed : F.temperature
  strainRateClosed : F.strainRate
  flowStressClosed : F.flowStress
  frictionModelClosed : F.frictionModel
  deformationZoneClosed : F.deformationZone

def FormingProcessClosed (F : FormingProcessPackage) : Prop :=
  F.temperature ∧ F.strainRate ∧ F.flowStress ∧ F.frictionModel ∧ F.deformationZone

theorem forming_process_closed_from_evidence (F : FormingProcessPackage) (E : FormingProcessEvidence F) : FormingProcessClosed F := by
  exact And.intro E.temperatureClosed (And.intro E.strainRateClosed (And.intro E.flowStressClosed (And.intro E.frictionModelClosed E.deformationZoneClosed)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse