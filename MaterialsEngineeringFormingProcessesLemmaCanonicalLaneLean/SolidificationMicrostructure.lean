import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure SolidificationMicrostructurePackage (A : AdmissibleClass) where
  dendriteArmSpacing : Prop
  solidificationFrontVelocity : Prop
  coolingRateEffect : Prop
  microstructureEvolution : Prop

structure SolidificationMicrostructureEvidence {A : AdmissibleClass} (M : SolidificationMicrostructurePackage A) where
  dendriteArmSpacingClosed : M.dendriteArmSpacing
  solidificationFrontVelocityClosed : M.solidificationFrontVelocity
  coolingRateEffectClosed : M.coolingRateEffect
  microstructureEvolutionClosed : M.microstructureEvolution

def SolidificationMicrostructureClosed {A : AdmissibleClass} (M : SolidificationMicrostructurePackage A) : Prop :=
  M.dendriteArmSpacing ∧ M.solidificationFrontVelocity ∧ M.coolingRateEffect ∧ M.microstructureEvolution

theorem solidification_microstructure_closed_from_evidence {A : AdmissibleClass} (M : SolidificationMicrostructurePackage A) (E : SolidificationMicrostructureEvidence M) : SolidificationMicrostructureClosed M := by
  exact And.intro E.dendriteArmSpacingClosed (And.intro E.solidificationFrontVelocityClosed (And.intro E.coolingRateEffectClosed E.microstructureEvolutionClosed))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse