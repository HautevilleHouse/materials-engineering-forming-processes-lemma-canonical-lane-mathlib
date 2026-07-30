import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure CrystallographicLattice where
  bravaisType : String
  unitCellVectors : Type u
  symmetryGroup : Type v
  latticeParameters : Prop
  bravaisTypeTerm : bravaisType = "fcc" ∨ bravaisType = "bcc" ∨ bravaisType = "hcp"
  unitCellVectorsDefined : Prop
  symmetryGroupClosed : Prop
  latticeParametersSatisfied : latticeParameters

structure CrystallographyEvidence (C : CrystallographicLattice) where
  latticeParametersClosed : C.latticeParameters
  bravaisTypeClosed : C.bravaisTypeTerm
  unitCellVectorsDefinedClosed : C.unitCellVectorsDefined
  symmetryGroupClosed : C.symmetryGroupClosed

def CrystallographyClosed (C : CrystallographicLattice) : Prop :=
  C.latticeParameters ∧ C.bravaisTypeTerm ∧ C.unitCellVectorsDefined ∧ C.symmetryGroupClosed

theorem crystallography_closed_from_evidence (C : CrystallographicLattice)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.latticeParametersClosed
    (And.intro E.bravaisTypeClosed
      (And.intro E.unitCellVectorsDefinedClosed E.symmetryGroupClosed))

end HautevilleHouse
end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
