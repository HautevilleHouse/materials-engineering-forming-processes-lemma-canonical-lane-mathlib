import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure PhaseDiagram where
  components : Nat
  phases : Type u
  phaseBoundaries : Type v
  gibbsFreeEnergyMinimized : Prop
  componentsDefined : components ≥ 1
  phasesClosed : Prop
  phaseBoundariesClosed : Prop
  gibbsClosed : gibbsFreeEnergyMinimized

structure PhaseDiagramEvidence (P : PhaseDiagram) where
  componentsClosed : P.components ≥ 1
  phasesClosed : P.phasesClosed
  phaseBoundariesClosed : P.phaseBoundariesClosed
  gibbsClosed : P.gibbsFreeEnergyMinimized

def PhaseDiagramClosed (P : PhaseDiagram) : Prop :=
  (P.components ≥ 1) ∧ P.phasesClosed ∧ P.phaseBoundariesClosed ∧ P.gibbsFreeEnergyMinimized

theorem phase_diagram_closed_from_evidence (P : PhaseDiagram)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.componentsClosed
    (And.intro E.phasesClosed
      (And.intro E.phaseBoundariesClosed E.gibbsClosed))

end HautevilleHouse
end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
