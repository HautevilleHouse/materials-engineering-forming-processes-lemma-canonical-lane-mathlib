import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure ElasticityTensor where
  stiffnessMatrix : Type u
  complianceMatrix : Type v
  symmetryConditions : Prop
  positiveDefiniteness : Prop
  stiffnessDefined : Prop
  complianceDefined : Prop
  symmetryClosed : symmetryConditions
  positivityClosed : positiveDefiniteness

structure ElasticityEvidence (E : ElasticityTensor) where
  stiffnessClosed : E.stiffnessDefined
  complianceClosed : E.complianceDefined
  symmetryClosed : E.symmetryConditions
  positivityClosed : E.positiveDefiniteness

def ElasticityClosed (E : ElasticityTensor) : Prop :=
  E.stiffnessDefined ∧ E.complianceDefined ∧ E.symmetryConditions ∧ E.positiveDefiniteness

theorem elasticity_closed_from_evidence (E : ElasticityTensor)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.stiffnessClosed
    (And.intro Ev.complianceClosed
      (And.intro Ev.symmetryClosed Ev.positivityClosed))

end HautevilleHouse
end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
