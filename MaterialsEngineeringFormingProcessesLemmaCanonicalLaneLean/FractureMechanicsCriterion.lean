import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemma

structure FractureCriterion where
  stressIntensityFactor : Type u
  fractureToughness : Type v
  criticalStressExceeded : Prop
  crackPropagationStable : Prop

structure FractureEvidence (F : FractureCriterion) where
  criticalStressExceededClosed : F.criticalStressExceeded
  crackPropagationStableClosed : F.crackPropagationStable

def FractureClosed (F : FractureCriterion) : Prop :=
  F.criticalStressExceeded ∧ F.crackPropagationStable

theorem fracture_closed_from_evidence (F : FractureCriterion) (E : FractureEvidence F) :
    FractureClosed F := by
  exact And.intro E.criticalStressExceededClosed E.crackPropagationStableClosed

end MaterialsEngineeringFormingProcessesLemma
end HautevilleHouse