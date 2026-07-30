import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemma

structure PhaseDiagram where
  phases : Type u
  transitionLines : Type v
  gibbsFreeEnergyMinimized : Prop
  phaseRegionCompact : Prop

structure PhaseStabilityEvidence (P : PhaseDiagram) where
  gibbsFreeEnergyMinimizedClosed : P.gibbsFreeEnergyMinimized
  phaseRegionCompactClosed : P.phaseRegionCompact

def PhaseStabilityClosed (P : PhaseDiagram) : Prop :=
  P.gibbsFreeEnergyMinimized ∧ P.phaseRegionCompact

theorem phase_stability_closed_from_evidence (P : PhaseDiagram) (E : PhaseStabilityEvidence P) :
    PhaseStabilityClosed P := by
  exact And.intro E.gibbsFreeEnergyMinimizedClosed E.phaseRegionCompactClosed

end MaterialsEngineeringFormingProcessesLemma
end HautevilleHouse