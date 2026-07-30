import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure FractureMechanicsPackage where
  fractureToughness : ℝ
  crackLength : ℝ
  stressIntensityFactor : ℝ
  parisLawExponent : ℝ
  fatigueCrackGrowthRate : ℝ → ℝ

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  fractureToughnessPositive : F.fractureToughness > 0
  crackLengthNonnegative : F.crackLength ≥ 0
  stressIntensityFactorCalculated : F.stressIntensityFactor > 0
  parisLawExponentPositive : F.parisLawExponent > 0
  fatigueCrackGrowthRateContinuous : Continuous F.fatigueCrackGrowthRate

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.fractureToughness > 0 ∧ F.crackLength ≥ 0 ∧ F.stressIntensityFactor > 0 ∧
  F.parisLawExponent > 0 ∧ Continuous F.fatigueCrackGrowthRate

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F :=
  by
    exact And.intro E.fractureToughnessPositive
      (And.intro E.crackLengthNonnegative
        (And.intro E.stressIntensityFactorCalculated
          (And.intro E.parisLawExponentPositive E.fatigueCrackGrowthRateContinuous)))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse