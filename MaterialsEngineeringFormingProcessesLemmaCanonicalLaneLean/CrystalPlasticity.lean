import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean

structure CrystalPlasticityPackage where
  slipSystems : Type
  criticalResolvedShearStress : Type
  hardeningModulus : Type
  crystalSymmetry : Prop
  slipGeometry : Prop
  dislocationDensityEvolution : Prop

structure CrystalPlasticityEvidence (G : CrystalPlasticityPackage) where
  crystalSymmetryClosed : G.crystalSymmetry
  slipGeometryClosed : G.slipGeometry
  dislocationDensityEvolutionClosed : G.dislocationDensityEvolution

def CrystalPlasticityClosed (G : CrystalPlasticityPackage) : Prop :=
  G.crystalSymmetry ∧ G.slipGeometry ∧ G.dislocationDensityEvolution

theorem crystal_plasticity_closed_from_evidence
    (G : CrystalPlasticityPackage) (E : CrystalPlasticityEvidence G) :
    CrystalPlasticityClosed G := by
  exact And.intro E.crystalSymmetryClosed
    (And.intro E.slipGeometryClosed E.dislocationDensityEvolutionClosed)

end MaterialsEngineeringFormingProcessesLemmaCanonicalLaneLean
end HautevilleHouse