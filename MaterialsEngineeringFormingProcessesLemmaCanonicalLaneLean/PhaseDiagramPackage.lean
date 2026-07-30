import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  components : List String
  phases : List String
  phaseBoundaries : List (String × String)
  criticalPoints : List (String × ℝ × ℝ)
  metastableRegions : List String

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  componentsNonempty : P.components ≠ []
  phasesNonempty : P.phases ≠ []
  phaseBoundariesValid : ∀ (b : String × String), b.1 ∈ P.phases ∧ b.2.1 ∈ P.phases
  criticalPointsNonempty : P.criticalPoints ≠ []
  metastableRegionsConsistent : P.metastableRegions ⊆ P.phases

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.components ≠ [] ∧ P.phases ≠ [] ∧ (∀ (b : String × String), b.1 ∈ P.phases ∧ b.2.1 ∈ P.phases) ∧
  P.criticalPoints ≠ [] ∧ P.metastableRegions ⊆ P.phases

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P :=
  by
    exact And.intro E.componentsNonempty
      (And.intro E.phasesNonempty
        (And.intro E.phaseBoundariesValid
          (And.intro E.criticalPointsNonempty E.metastableRegionsConsistent)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse