import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure PhaseTransformationKineticsPackage (A : AdmissibleClass) where
  nucleationRate : Prop
  growthRate : Prop
  avramiEquation : Prop
  phaseFraction : Prop

structure PhaseTransformationKineticsEvidence {A : AdmissibleClass} (K : PhaseTransformationKineticsPackage A) where
  nucleationRateClosed : K.nucleationRate
  growthRateClosed : K.growthRate
  avramiEquationClosed : K.avramiEquation
  phaseFractionClosed : K.phaseFraction

def PhaseTransformationKineticsClosed {A : AdmissibleClass} (K : PhaseTransformationKineticsPackage A) : Prop :=
  K.nucleationRate ∧ K.growthRate ∧ K.avramiEquation ∧ K.phaseFraction

theorem phase_transformation_kinetics_closed_from_evidence {A : AdmissibleClass} (K : PhaseTransformationKineticsPackage A) (E : PhaseTransformationKineticsEvidence K) : PhaseTransformationKineticsClosed K := by
  exact And.intro E.nucleationRateClosed (And.intro E.growthRateClosed (And.intro E.avramiEquationClosed E.phaseFractionClosed))

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse