package rally.models;

import java.time.LocalTime;

public class Chrono {
    private int idChrono;
    private int idRally;
    private int idSpecial;
    private int idPilote;
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
