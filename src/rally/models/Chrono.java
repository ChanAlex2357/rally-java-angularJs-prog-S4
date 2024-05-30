package rally.models;

import java.time.LocalTime;

public class Chrono {
    private int idChrono;
    private int idRally;
    private int idSpecial;
    private int idPilote;
    private LocalTime temps;
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
}
