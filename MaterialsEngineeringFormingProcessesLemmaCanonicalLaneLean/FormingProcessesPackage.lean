import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure FormingProcessesPackage where
  processType : String
  temperature : ℝ
  strainRate : ℝ
  flowStress : ℝ → ℝ
  formingLimit : ℝ → ℝ

structure FormingProcessesEvidence (F : FormingProcessesPackage) where
  processTypeValid : F.processType ∈ ["rolling", "forging", "extrusion", "drawing", "stamping"]
  temperaturePositive : F.temperature > 0
  strainRatePositive : F.strainRate > 0
  flowStressContinuous : Continuous F.flowStress
  formingLimitContinuous : Continuous F.formingLimit

def FormingProcessesClosed (F : FormingProcessesPackage) : Prop :=
  F.processType ∈ ["rolling", "forging", "extrusion", "drawing", "stamping"] ∧
  F.temperature > 0 ∧ F.strainRate > 0 ∧
  Continuous F.flowStress ∧ Continuous F.formingLimit

theorem forming_processes_closed_from_evidence (F : FormingProcessesPackage) (E : FormingProcessesEvidence F) : FormingProcessesClosed F :=
  by
    exact And.intro E.processTypeValid
      (And.intro E.temperaturePositive
        (And.intro E.strainRatePositive
          (And.intro E.flowStressContinuous E.formingLimitContinuous)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse