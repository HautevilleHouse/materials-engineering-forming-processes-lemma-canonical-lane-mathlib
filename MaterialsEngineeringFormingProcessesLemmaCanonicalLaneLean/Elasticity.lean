import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure ElasticityPackage where
  stressTensor : Type u
  strainTensor : Type v
  constitutiveLaw : Prop
  youngModulus : Prop
  poissonRatio : Prop
  hookeLaw : Prop
  compatibility : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  constitutiveLawClosed : E.constitutiveLaw
  youngModulusClosed : E.youngModulus
  poissonRatioClosed : E.poissonRatio
  hookeLawClosed : E.hookeLaw
  compatibilityClosed : E.compatibility

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.constitutiveLaw ∧ E.youngModulus ∧ E.poissonRatio ∧ E.hookeLaw ∧ E.compatibility

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.constitutiveLawClosed (And.intro Ev.youngModulusClosed (And.intro Ev.poissonRatioClosed (And.intro Ev.hookeLawClosed Ev.compatibilityClosed)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse