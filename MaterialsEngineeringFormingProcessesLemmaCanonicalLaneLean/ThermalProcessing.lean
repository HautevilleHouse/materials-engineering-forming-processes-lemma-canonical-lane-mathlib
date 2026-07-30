import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure ThermalTreatment where
  temperatureProfile : Type u
  phaseTransformation : Type v
  heatTransferModel : Prop
  temperatureControl : Prop
  transformationComplete : Prop
  heatModelClosed : heatTransferModel
  tempControlClosed : temperatureControl
  transformationClosed : transformationComplete

structure ThermalEvidence (T : ThermalTreatment) where
  heatModelClosed : T.heatTransferModel
  tempControlClosed : T.temperatureControl
  transformationClosed : T.transformationComplete

def ThermalClosed (T : ThermalTreatment) : Prop :=
  T.heatTransferModel ∧ T.temperatureControl ∧ T.transformationComplete

theorem thermal_closed_from_evidence (T : ThermalTreatment)
    (E : ThermalEvidence T) : ThermalClosed T := by
  exact And.intro E.heatModelClosed
    (And.intro E.tempControlClosed E.transformationClosed)

end HautevilleHouse
end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
