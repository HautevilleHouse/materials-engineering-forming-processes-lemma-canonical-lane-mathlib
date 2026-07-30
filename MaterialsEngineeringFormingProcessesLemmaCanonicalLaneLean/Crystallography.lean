import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLattice : Type u
  unitCell : Type v
  spaceGroup : Type w
  latticeParameters : Prop
  symmetryOperations : Prop
  diffractionPattern : Prop
  crystalSystemIdentified : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeParametersClosed : C.latticeParameters
  symmetryOperationsClosed : C.symmetryOperations
  diffractionPatternClosed : C.diffractionPattern
  crystalSystemIdentifiedClosed : C.crystalSystemIdentified

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeParameters ∧ C.symmetryOperations ∧ C.diffractionPattern ∧ C.crystalSystemIdentified

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.latticeParametersClosed (And.intro E.symmetryOperationsClosed (And.intro E.diffractionPatternClosed E.crystalSystemIdentifiedClosed))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse