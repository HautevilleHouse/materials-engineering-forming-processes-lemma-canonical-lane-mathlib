import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean.ConstitutiveModel

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure CrystalPlasticityAnalyticCertificate (G : CrystalPlasticityPackage) where
  schmidLaw : Prop
  hardeningEvolution : Prop
  rateDependence : Prop
  schmidLawClosed : schmidLaw
  hardeningEvolutionClosed : hardeningEvolution
  rateDependenceClosed : rateDependence
  crystalEvidence : CrystalPlasticityEvidence G

def CrystalPlasticityAnalyticCertificateClosed {G : CrystalPlasticityPackage} (C : CrystalPlasticityAnalyticCertificate G) : Prop :=
  C.schmidLaw ∧ C.hardeningEvolution ∧ C.rateDependence ∧ CrystalPlasticityClosed G

theorem crystal_plasticity_analytic_certificate_closed
    {G : CrystalPlasticityPackage} (C : CrystalPlasticityAnalyticCertificate G) :
    CrystalPlasticityAnalyticCertificateClosed C := by
  exact And.intro C.schmidLawClosed
    (And.intro C.hardeningEvolutionClosed
      (And.intro C.rateDependenceClosed
        (crystal_plasticity_closed_from_evidence G C.crystalEvidence)))

structure YieldSurfaceAnalyticCertificate (G : YieldSurfacePackage) where
  vonMisesCriterion : Prop
  isotropicHardeningRule : Prop
  plasticFlowRule : Prop
  vonMisesCriterionClosed : vonMisesCriterion
  isotropicHardeningRuleClosed : isotropicHardeningRule
  plasticFlowRuleClosed : plasticFlowRule
  yieldEvidence : YieldSurfaceEvidence G

def YieldSurfaceAnalyticCertificateClosed {G : YieldSurfacePackage} (Y : YieldSurfaceAnalyticCertificate G) : Prop :=
  Y.vonMisesCriterion ∧ Y.isotropicHardeningRule ∧ Y.plasticFlowRule ∧ YieldSurfaceClosed G

theorem yield_surface_analytic_certificate_closed
    {G : YieldSurfacePackage} (Y : YieldSurfaceAnalyticCertificate G) :
    YieldSurfaceAnalyticCertificateClosed Y := by
  exact And.intro Y.vonMisesCriterionClosed
    (And.intro Y.isotropicHardeningRuleClosed
      (And.intro Y.plasticFlowRuleClosed
        (yield_surface_closed_from_evidence G Y.yieldEvidence)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse