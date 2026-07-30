import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemma

structure FormingProcess where
  deformationMechanism : Type u
  processParameters : Type v
  energyMinimized : Prop
  microstructurePreserved : Prop

structure FormingOptimalityEvidence (F : FormingProcess) where
  energyMinimizedClosed : F.energyMinimized
  microstructurePreservedClosed : F.microstructurePreserved

def FormingOptimalityClosed (F : FormingProcess) : Prop :=
  F.energyMinimized ∧ F.microstructurePreserved

theorem forming_optimality_closed_from_evidence (F : FormingProcess) (E : FormingOptimalityEvidence F) :
    FormingOptimalityClosed F := by
  exact And.intro E.energyMinimizedClosed E.microstructurePreservedClosed

end MaterialsEngineeringFormingProcessesLemma
end HautevilleHouse