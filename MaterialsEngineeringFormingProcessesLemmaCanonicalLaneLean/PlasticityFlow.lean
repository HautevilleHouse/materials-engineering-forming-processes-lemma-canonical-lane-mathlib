import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure PlasticityModel where
  yieldSurface : Type u
  flowRule : Type v
  hardeningLaw : Type w
  yieldCondition : Prop
  flowRuleValid : Prop
  hardeningConsistent : Prop
  yieldClosed : yieldCondition
  flowClosed : flowRuleValid
  hardeningClosed : hardeningConsistent

structure PlasticityEvidence (P : PlasticityModel) where
  yieldClosed : P.yieldCondition
  flowClosed : P.flowRuleValid
  hardeningClosed : P.hardeningConsistent

def PlasticityClosed (P : PlasticityModel) : Prop :=
  P.yieldCondition ∧ P.flowRuleValid ∧ P.hardeningConsistent

theorem plasticity_closed_from_evidence (P : PlasticityModel)
    (E : PlasticityEvidence P) : PlasticityClosed P := by
  exact And.intro E.yieldClosed
    (And.intro E.flowClosed E.hardeningClosed)

end HautevilleHouse
end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
