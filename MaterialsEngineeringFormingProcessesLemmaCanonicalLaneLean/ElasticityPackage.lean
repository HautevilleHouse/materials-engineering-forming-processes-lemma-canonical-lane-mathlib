import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure ElasticityPackage where
  youngModulus : ℝ
  poissonRatio : ℝ
  yieldStrength : ℝ
  elasticLimit : ℝ
  stressStrainCurve : ℝ → ℝ

structure ElasticityEvidence (E : ElasticityPackage) where
  youngModulusPositive : E.youngModulus > 0
  poissonRatioInRange : E.poissonRatio > 0 ∧ E.poissonRatio < 0.5
  yieldStrengthPositive : E.yieldStrength > 0
  elasticLimitPositive : E.elasticLimit > 0
  stressStrainCurveContinuous : Continuous E.stressStrainCurve

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.youngModulus > 0 ∧ (E.poissonRatio > 0 ∧ E.poissonRatio < 0.5) ∧
  E.yieldStrength > 0 ∧ E.elasticLimit > 0 ∧ Continuous E.stressStrainCurve

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) : ElasticityClosed E :=
  by
    exact And.intro Ev.youngModulusPositive
      (And.intro Ev.poissonRatioInRange
        (And.intro Ev.yieldStrengthPositive
          (And.intro Ev.elasticLimitPositive Ev.stressStrainCurveContinuous)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse