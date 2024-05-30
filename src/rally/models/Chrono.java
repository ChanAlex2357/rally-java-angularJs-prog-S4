package rally.models;

import java.time.LocalTime;

import jca.dao.models.annotations.Attribute;
import jca.dao.models.annotations.EntityModels;

@EntityModels(name = "Chrono" )
public class Chrono {
    @Attribute(name = "id_chrono" )
    private int idChrono;
    @Attribute(name = "id_rally")
    private int idRally;
    @Attribute(name = "id_special")
    private int idSpecial;
    @Attribute(name = "id_pilote")
    private int idPilote;
    @Attribute(name = "temps")
    private LocalTime temps;

    public Chrono(){}
    public Chrono(
        int idRally,
        int idSpecial,
        int idPilote,
        int hour,
        int minute,
        int seconds,
        int nano
    ){
        setIdRally(idRally);
        setIdPilote(idPilote);
        setIdRally(idRally);
        setTemps(hour, minute, seconds, nano);
    }
    public int getIdChrono() {
        return idChrono;
    }
    public void setIdChrono(int idChrono) {
        this.idChrono = idChrono;
    }
    public int getIdRally() {
        return idRally;
    }
    public void setIdRally(int idRally) {
        this.idRally = idRally;
    }
    public int getIdSpecial() {
        return idSpecial;
    }
    public void setIdSpecial(int idSpecial) {
        this.idSpecial = idSpecial;
    }
    public int getIdPilote() {
        return idPilote;
    }
    public void setIdPilote(int idPilote) {
        this.idPilote = idPilote;
    }
    public LocalTime getTemps() {
        return temps;
    }
    public void setTemps(LocalTime temps) {
        this.temps = temps;
    }
    private void setTemps(int hour , int minute , int seconds , int nano){
        LocalTime time = LocalTime.of(hour, minute, seconds,nano);
        setTemps(time);
    }


}
