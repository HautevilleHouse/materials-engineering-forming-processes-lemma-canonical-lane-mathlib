import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure CrystalPlasticityEvidenceTerms {G : CrystalPlasticityPackage} (C : CrystalPlasticityAnalyticCertificate G) where
  schmidLaw : C.schmidLaw
  hardeningEvolution : C.hardeningEvolution
  rateDependence : C.rateDependence
  crystalClosed : CrystalPlasticityClosed G

def CrystalPlasticityAnalyticCertificate.evidenceTerms {G : CrystalPlasticityPackage}
    (C : CrystalPlasticityAnalyticCertificate G) : CrystalPlasticityEvidenceTerms C :=
  {
    schmidLaw := C.schmidLawClosed
    hardeningEvolution := C.hardeningEvolutionClosed
    rateDependence := C.rateDependenceClosed
    crystalClosed := crystal_plasticity_closed_from_evidence G C.crystalEvidence
  }

structure YieldSurfaceEvidenceTerms {G : YieldSurfacePackage} (Y : YieldSurfaceAnalyticCertificate G) where
  vonMisesCriterion : Y.vonMisesCriterion
  isotropicHardeningRule : Y.isotropicHardeningRule
  plasticFlowRule : Y.plasticFlowRule
  yieldClosed : YieldSurfaceClosed G

def YieldSurfaceAnalyticCertificate.evidenceTerms {G : YieldSurfacePackage}
    (Y : YieldSurfaceAnalyticCertificate G) : YieldSurfaceEvidenceTerms Y :=
  {
    vonMisesCriterion := Y.vonMisesCriterionClosed
    isotropicHardeningRule := Y.isotropicHardeningRuleClosed
    plasticFlowRule := Y.plasticFlowRuleClosed
    yieldClosed := yield_surface_closed_from_evidence G Y.yieldEvidence
  }

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse