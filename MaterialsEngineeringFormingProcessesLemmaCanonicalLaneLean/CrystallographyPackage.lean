import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure CrystallographyPackage where
  latticeType : String
  unitCellVolume : ℝ
  bravaisLattice : Prop
  symmetryGroup : String
  laueClass : String

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeTypeIdentified : C.latticeType ≠ ""
  unitCellVolumePositive : C.unitCellVolume > 0
  bravaisLatticeSatisfied : C.bravaisLattice
  symmetryGroupDetermined : C.symmetryGroup ≠ ""
  laueClassDetermined : C.laueClass ≠ ""

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeType ≠ "" ∧ C.unitCellVolume > 0 ∧ C.bravaisLattice ∧
  C.symmetryGroup ≠ "" ∧ C.laueClass ≠ ""

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) : CrystallographyClosed C :=
  by
    exact And.intro E.latticeTypeIdentified
      (And.intro E.unitCellVolumePositive
        (And.intro E.bravaisLatticeSatisfied
          (And.intro E.symmetryGroupDetermined E.laueClassDetermined)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse