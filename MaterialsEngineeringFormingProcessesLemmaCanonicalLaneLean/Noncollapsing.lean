import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean.CrystalPlasticity

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure NoncollapsingPackage {G : CrystalPlasticityPackage} (CP : CrystalPlasticityPackage G) where
  noDamageLocalization : Prop
  stableFlowStress : Prop
  uniformDeformation : Prop

structure NoncollapsingEvidence {G : CrystalPlasticityPackage} {CP : CrystalPlasticityPackage G} (N : NoncollapsingPackage CP) where
  noDamageLocalizationClosed : N.noDamageLocalization
  stableFlowStressClosed : N.stableFlowStress
  uniformDeformationClosed : N.uniformDeformation

def NoncollapsingClosed {G : CrystalPlasticityPackage} {CP : CrystalPlasticityPackage G} (N : NoncollapsingPackage CP) : Prop :=
  N.noDamageLocalization ∧ N.stableFlowStress ∧ N.uniformDeformation

theorem noncollapsing_closed_from_evidence
    {G : CrystalPlasticityPackage} {CP : CrystalPlasticityPackage G}
    (N : NoncollapsingPackage CP) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.noDamageLocalizationClosed
    (And.intro E.stableFlowStressClosed E.uniformDeformationClosed)

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse