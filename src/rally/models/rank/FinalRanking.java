package rally.models.rank;

import java.time.LocalTime;

import jca.dao.models.annotations.Attribute;
import jca.dao.models.annotations.EntityModels;
import jca.dao.models.annotations.PrimaryKey;

@EntityModels(name = "v_final_rank")
public class FinalRanking {
    
    @PrimaryKey
    @Attribute(name = "id_pilote")
    private int idPilote;
    @Attribute(name = "nom_pilote")
    private String nomPilote;
    @Attribute(name = "id_categorie")
    private int idCategorie;
    @Attribute(name = "nom_categorie")
    private String nomCategorie;
    @Attribute(name = "total_temps")
    private LocalTime totalTime;
    @Attribute(name = "total_points")
    private int totalPoints;
    @Attribute(name = "general_points")
    private int generalPoints;
    @Attribute(name = "power_points")
    private int powerPoints;
    @Attribute(name = "rally_wins")
    private int rallyWins;
    @Attribute(name = "final_rank")
    private int finalRank;

    @Override
    public String toString() {
        return 
            "Id Pilote : "+getIdPilote()
            +" | Nom Pilote : "+getNomPilote()
            +" | Id Categorie : "+getIdCategorie()
            +" | Nom Categorie : "+getNomCategorie()
            +" | T.Temps : "+getTotalTime()
            +" | T.Points : "+getTotalPoints();
    }
    public FinalRanking(){};

    public int getIdPilote() {
        return idPilote;
    }
    public void setIdPilote(int idPilote) {
        this.idPilote = idPilote;
    }
    public String getNomPilote() {
        return nomPilote;
    }
    public void setNomPilote(String nomPilote) {
        this.nomPilote = nomPilote;
    }
    public int getIdCategorie() {
        return idCategorie;
    }
    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }
    public String getNomCategorie() {
        return nomCategorie;
    }
    public void setNomCategorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }
    public LocalTime getTotalTime() {
        return totalTime;
    }
    public void setTotalTime(LocalTime totalTime) {
        this.totalTime = totalTime;
    }
    public int getTotalPoints() {
        return totalPoints;
    }
    public void setTotalPoints(int totalPoints) {
        this.totalPoints = totalPoints;
    }
    public int getGeneralPoints() {
        return generalPoints;
    }
    public void setGeneralPoints(int generalPoints) {
        this.generalPoints = generalPoints;
    }
    public int getPowerPoints() {
        return powerPoints;
    }
    public void setPowerPoints(int powerPoints) {
        this.powerPoints = powerPoints;
    }
    public int getRallyWins() {
        return rallyWins;
    }
    public void setRallyWins(int rallyWins) {
        this.rallyWins = rallyWins;
    }
    public int getFinalRank() {
        return finalRank;
    }
    public void setFinalRank(int finalRank) {
        this.finalRank = finalRank;
    }

}
