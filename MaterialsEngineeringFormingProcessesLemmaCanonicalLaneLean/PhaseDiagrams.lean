import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  components : Type u
  phases : Type v
  temperatureRange : Prop
  compositionRange : Prop
  phaseBoundaries : Prop
  eutecticPoint : Prop
  leverRule : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureRangeClosed : P.temperatureRange
  compositionRangeClosed : P.compositionRange
  phaseBoundariesClosed : P.phaseBoundaries
  eutecticPointClosed : P.eutecticPoint
  leverRuleClosed : P.leverRule

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.temperatureRange ∧ P.compositionRange ∧ P.phaseBoundaries ∧ P.eutecticPoint ∧ P.leverRule

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.temperatureRangeClosed (And.intro E.compositionRangeClosed (And.intro E.phaseBoundariesClosed (And.intro E.eutecticPointClosed E.leverRuleClosed)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse