import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure ThermomechanicalProcessingPackage (A : AdmissibleClass) where
  flowStress : Prop
  recrystallization : Prop
  grainSizeEvolution : Prop
  textureDevelopment : Prop

structure ThermomechanicalProcessingEvidence {A : AdmissibleClass} (T : ThermomechanicalProcessingPackage A) where
  flowStressClosed : T.flowStress
  recrystallizationClosed : T.recrystallization
  grainSizeEvolutionClosed : T.grainSizeEvolution
  textureDevelopmentClosed : T.textureDevelopment

def ThermomechanicalProcessingClosed {A : AdmissibleClass} (T : ThermomechanicalProcessingPackage A) : Prop :=
  T.flowStress ∧ T.recrystallization ∧ T.grainSizeEvolution ∧ T.textureDevelopment

theorem thermomechanical_processing_closed_from_evidence {A : AdmissibleClass} (T : ThermomechanicalProcessingPackage A) (E : ThermomechanicalProcessingEvidence T) : ThermomechanicalProcessingClosed T := by
  exact And.intro E.flowStressClosed (And.intro E.recrystallizationClosed (And.intro E.grainSizeEvolutionClosed E.textureDevelopmentClosed))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse